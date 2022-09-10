const functions = require("firebase-functions");
const firebase = require("firebase-admin");
const formidable = require('formidable-serverless');

firebase.initializeApp();

exports.helloWorld = functions.https.onRequest((request, response) => {
    functions.logger.info("Hello logs!", { structuredData: true });
    response.send("Hello from Firebase!");
});

exports.uploadFile = functions.https.onRequest((req, res) => {
    var form = new formidable.IncomingForm();
    
    form.parse(req, async function (err, fields, files) {
        try {
            var filePath = files.file.path;
            functions.logger.info(`file path is ${filePath}`);
            const response = await firebase.storage().bucket().upload(filePath, {
                destination:  `${req.query.upload_to ?? ''}` + files.file.name,
            });
            return res.status(200).send(response[0].metadata.mediaLink);
        } catch (error) {
            return res.status(500).send(error);
        }
    }
    );

});

exports.getAllFiles = functions.https.onRequest(async (req, res) => {
    try {
        const files = await firebase.storage().bucket().getFiles('uploads');
        return res.status(200).send(files[0]);
    } catch (error) {
        return res.status(500).send(error);
    }
}
);


exports.getFile = functions.https.onRequest(async (req, res) => {
    try {
        const file = await firebase.storage().bucket().file(req.query.file_name).get();
        return res.status(200).send(file[0].metadata.mediaLink);
    } catch (error) {
        return res.status(500).send(error);
    }
}
);

exports.downloadFile = functions.https.onRequest(async (req, res) => {
    try {
        functions.logger.info(`file name is ${req.query.fileName}`);
        const file = await firebase.storage().bucket().file(req.query.file).download();
        return res.status(200).send(file[0]);
    } catch (error) {
        return res.status(500).send(error);
    }
}
);

exports.deleteFile = functions.https.onRequest(async (req, res) => {
    try {
        functions.logger.info(`file name is ${req.query.fileName}`);
        const file = await firebase.storage().bucket().file(req.query.file).delete();
        return res.status(200).send(file[0]);
    } catch (error) {
        return res.status(500).send(error);
    }
}
);

exports.deleteAllFiles = functions.https.onRequest(async (req, res) => {
    try {
        const files = await firebase.storage().bucket().getFiles();
        files[0].forEach(async (file) => {
            await file.delete();
        });
        return res.status(200).send('All files deleted');
    } catch (error) {
        return res.status(500).send(error);
    }
});
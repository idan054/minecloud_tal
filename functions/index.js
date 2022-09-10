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
                destination: 'files/' + files.file.name,
            });
            return res.status(200).send(response[0].metadata.mediaLink);
        } catch (error) {
            return res.status(500).send(error);
        }
    }
    );

});
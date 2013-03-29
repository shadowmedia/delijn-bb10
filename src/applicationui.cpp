// Default empty project template
#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/system/InvokeManager.hpp>
#include <bb/system/InvokeRequest.hpp>
#include <bb/system/InvokeTargetReply.hpp>

using namespace bb::cascades;
using namespace bb::system;

ApplicationUI::ApplicationUI(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    qml->setContextProperty("_delijnapp", this);
    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    // set created root object as a scene
    app->setScene(root);
}

void ApplicationUI::InvokeSms( QString data )
{
	InvokeManager *invokeManager = new InvokeManager(this);
	InvokeRequest request;
	request.setTarget("sys.pim.text_messaging.composer");
	request.setAction("bb.action.COMPOSE" );
	request.setMimeType("application/text_messaging");
	request.setData(data.toAscii());
	InvokeTargetReply *reply = invokeManager->invoke(request);
}

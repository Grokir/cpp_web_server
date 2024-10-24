#include <QCoreApplication>

#include <QHttpServer>
#include <QHttpServerResponse>

int main(int argc, char** argv)
{
    try
    {
        QCoreApplication app(argc, argv);

        QHttpServer httpServer;

        return app.exec();
    }
    catch (...)
    {
        return -1;
    }
}
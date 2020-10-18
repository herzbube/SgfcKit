// SgfcKit includes
#import <SGFCKitFactory.h>
#import <SGFCDocument.h>

int main (int argc, const char* argv[])
{
  @autoreleasepool
  {
    SGFCDocument* document = [SGFCKitFactory document];
    [document debugPrintToConsole];
  }

  return 0;
}


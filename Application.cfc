﻿component
    output="false"
    hint="I define the application settings and event handlers."
    {


    // Define our standard Application settings.
    this.name = hash( getCurrentTemplatePath() );
    this.applicationTimeout = createTimeSpan( 0, 0, 1, 0 );

    // Define our per-application Java library settings. Here, we
    // are telling it to load JAR and CLASS files in the lib directory
    // that is located in our application root. In this case, we are
    // loading the JSoup 1.6.2 Class for parsing, traversing, and
    // mutating HTML Documents.
    this.javaSettings = {
        loadPaths: [
            "./jars/"
        ],
        loadColdFusionClassPath: true
    };


}
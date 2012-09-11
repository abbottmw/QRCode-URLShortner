component
    output="false"
    hint="I define the application settings and event handlers."
    {


    // Define our standard Application settings.
    this.name = hash( GetDirectoryFromPath(getCurrentTemplatePath()) );
    this.applicationTimeout = createTimeSpan( 0, 0, 1, 0 );

    /*
    Use the new CF10 feature to load jars
    CF9 will need to place the jar files in the WEB-INF/lib folder
    */
    this.javaSettings = {
        loadPaths: [
            "./jars/"
        ],
        loadColdFusionClassPath: true
    };


}
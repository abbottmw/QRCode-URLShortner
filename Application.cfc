component
    output="false"
    hint="I define the application settings and event handlers."
    {


    // Define our standard Application settings.
    this.name = hash( GetDirectoryFromPath(getCurrentTemplatePath()) );
    this.applicationTimeout = createTimeSpan( 0, 0, 1, 0 );


}
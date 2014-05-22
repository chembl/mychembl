<? include "header.php"; ?> 

      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="/">Home</a></li>
        </ul>
        <h3 class="text-muted">myChEMBL KNIME Integration</h3>
      </div>


      <div class="row mychembl-faq">
        <div class="col-lg-12">
          <h4><i class="fa fa-rocket"></i>&nbsp;What is KNIME?</h4>
          <p>KNIME is an open source modular graphical workbench for data processing and analysis. 
          KNIME users can build workflows by executing predefined components, called <em>nodes</em>, in a process known as <em>visual programming</em>. 
          Among other fields, KNIME has several extensions for life sciences, including bio- and chemoinformatics.</p>
          
          <h4><i class="fa fa-rocket"></i>&nbsp;How do I get KNIME?</h4>
          <p>Installing KNIME is really easy across all popular platforms (Windows, Mac OS, Linux). 
          Just follow <a href="http://www.knime.org/node/81" target="_blank">this</a> link.</p>
          
          <h4><i class="fa fa-rocket"></i>&nbsp;How do I find out more about KNIME?</h4>
          <p>Here’s a useful <a href="http://www.knime.org/learning-hub" target="_blank">page</a>. 
          For a basic introduction to KNIME followed by a few chemoinformatics applciations, see <a href="http://www.slideshare.net/gpapadatos/knime-tutorial" target="_blank">this</a> slideshow.</p>
          
          <h4><i class="fa fa-rocket"></i>&nbsp;How to I use KNIME with the myChEMBL VM?</h4>
          <p>You can access the data in myChEMBL directly from a KNIME desktop running on your host machine. 
          This can be achieved in two ways:
          <ul>
          <li>Direct database connection with the Database Reader node. 
          The node can execute arbitrary SQL SELECT commands and retrieve the results in a KNIME table.</li>
          <li>Calls to the RESTful <a href="/chemblws/docs" target="_blank">web services</a> that are hosted in myChEMBL. 
          This is achieved with the KNIME REST (<a href="http://tech.knime.org/book/krest-rest-nodes-for-knime-trusted-extension" target="_blank">KREST</a>) nodes, which are available as community node contribution. 
          The KREST nodes send GET or POST requests to the server and format the response back to a KNIME table.</li>
          </ul>
          </p>
          <p>For an example workflow showcasing the KNIME/myChEMBL connectivity, download <a href="/assets/knime/myChEMBL18_KNIME.zip">this</a> file to your host machine. 
          Then, open your KNIME desktop on your host machine and click File --> Import KNIME workflow... --> Select archive file --> Browse.. and then navigate to the zip file you’ve just downloaded and click Finish. 
          If everything worked properly, you will be able to see something like this on your KNIME desktop:
          </p>
          
          <span><img src="/assets/img/knime_workflows.png" /></a>
    
          <h4><i class="fa fa-rocket"></i>&nbsp;Downloads</h4>
          <p><a href="/assets/knime/myChEMBL18_KNIME.zip">myChEMBL18_KNIME.zip</a></p>
          
        </div>
      </div>

<? include "footer.php"; ?> 
      

<? include "header.php"; ?> 

      <div class="jumbotron">
        <h1 style="margin-bottom:25px;"><img src="assets/img/chembl.png" width=70 height=70 />&nbsp;myChEMBL LaunchPad</h1>
        <p class="lead">Welcome to the myChEMBL LaunchPad, providing access to all resources distributed with the myChEMBL virtual machine.</p>
      </div>

      <div class="row">
        
        <div class="col-lg-4">
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="mychembl/app/home.php" target="_blank">Web Interface</a></h3>
          <p>This web interface provides quick access to the myChEMBL data without any prior knowledge of SQL or RDKit.</p>
        </div>
       
        <div class="col-lg-4">      
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="phppgadmin" target="_blank">phpPgAdmin Console</a></h3>        
          <p>Use the console to explore the myChEMBL PostgreSQL database and run SQL queries (<strong>user:</strong> mychembl, <strong>password:</strong> read).</p>        
        </div>
        
        <div class="col-lg-4">
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="chemblws/docs/" target="_blank">Web Services</a></h3>
          <p>Access to a local version of the official ChEMBL Web Services, which connect to the myChEMBL PostgreSQL database.</p>     
        </div>
      
      </div>
 
      <div class="row">
        
        <div class="col-lg-4">
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="/" onclick="javascript:event.target.port=8888" target="_blank">IPython Notebooks</a></h3>
          <p>A selection of programmatic tutorials written in Python and presented using interactive IPython Notebooks.</p> 
        </div>

        <div class="col-lg-4">
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="knime" target="_blank">KNIME Integration</a></h3>
          <p>Learn how to connect the KNIME workbench to myChEMBL and also how to start processing ChEMBL data within a workflow environment.</p>
        </div>

        <div class="col-lg-4">
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="/utils/docs" target="_blank">ChEMBL Beaker</a></h3>
          <p>Access the functionality of the <a href="http://www.rdkit.org/">RDKit</a> chemical toolkit and the optical structure recognition software <a href="http://cactus.nci.nih.gov/osra/">OSRA</a>, via a RESTful API.</p> 
        </div>
      </div>
      
      <div class="row">
        <div class="col-lg-4"></div>
            
        <div class="col-lg-4">
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="more" target="_blank">More Information</a></h3>
          <p>For more details on the myChEMBL project, including background, acknowledgements and references.</p>
        </div>
        
        <div class="col-lg-4"></div>
        
      </div>

<? include "footer.php"; ?>

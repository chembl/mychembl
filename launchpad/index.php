<? include "header.php"; ?> 

      <div class="jumbotron">
        <h1 style="margin-bottom:25px;"><img src="assets/img/chembl.png" width=70 height=70 />&nbsp;myChEMBL LaunchPad</h1>
        <p class="lead">Welcome to the myChEMBL LaunchPad, providing access to all resources distributed with the myChEMBL virtual machine.</p>
      </div>

      <div class="row">
        <div class="col-lg-4">
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="chemblws/docs/" target="_blank">ChEMBL Web Services</a></h3>
          <p>Access to a local version of the official ChEMBL Web Services, which connect to the myChEMBL PostgreSQL database.</p>

          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="mychembl/app/home.php" target="_blank">myChEMBL Web Interface</a></h3>
          <p>The myChEMBL Web Interface is a user-friendly application, providing quick access to the myChEMBL data without any prior knowledge of SQL or RDKit.</p>
          
        </div>

        <div class="col-lg-4">
            
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="phppgadmin" target="_blank">phpPgAdmin Console</a></h3>        
          <p>Use the phpPgAdmin console to explore the myChEMBL PostgreSQL database (including RDKit chemical cartridge tables) and run SQL queries. 
            <ul>
              <li><strong>username:</strong> mychembl</li>
              <li><strong>password:</strong> read</li>
            </ul>
          </p>

          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="knime" target="_blank">KNIME Integration</a></h3>
          <p>Learn how to connect the KNIME workbench to myChEMBL and also how to start processing ChEMBL data within a workflow environment.</p>
                          
        </div>
        
        <div class="col-lg-4">
        
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="/" onclick="javascript:event.target.port=8888" target="_blank">IPython Notebooks</a></h3>
          <p>A selection of programmatic tutorials written in Python and presented using interactive IPython Notebooks, some examples:</p> 
            <ul>
              <li><a href="/notebooks/01_myChEMBL_introduction.ipynb" onclick="javascript:event.target.port=8888" target="_blank">myChEMBL introduction</a></li>
              <li><a href="/notebooks/02_myChEMBL_web_services.ipynb" onclick="javascript:event.target.port=8888" target="_blank">Using myChEMBL Web Services</a></li>
              <li><a href="/notebooks/03_myChEMBL_predict_targets.ipynb" onclick="javascript:event.target.port=8888" target="_blank">Building predictive target models</a></li>
            </ul>
          </p>
        
          <h3><i class="fa fa-rocket"></i>&nbsp;<a href="more" target="_blank">More Information</a></h3>
          <p>For more details on the myChEMBL project, including background, acknowledgements and references.</p>
          
        </div>
      </div>

<? include "footer.php"; ?>

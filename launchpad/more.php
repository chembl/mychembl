<? include "header.php"; ?> 

      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="/">Home</a></li>
        </ul>
        <h3 class="text-muted">More Information</h3>
      </div>


      <div class="row mychembl-faq">
        <div class="col-lg-12">
          <h4><i class="fa fa-rocket"></i>&nbsp;What is myChEMBL?</h4>
          <p>myChEMBL is a completely open platform, which combines public domain bioactivity data with open source database and cheminformatics technologies. myChEMBL consists of a Linux (Ubuntu) Virtual Machine featuring a PostgreSQL schema with the latest version of the ChEMBL database, as well as the latest RDKit cheminformatics libraries.</p>

          <h4><i class="fa fa-rocket"></i>&nbsp;Why should I use myChEMBL?</h4>
          <p>myChEMBL is a free and open platform aimed at anyone interested in drug discovery, cheminformatics and bioinformatics. Some reasons why you might want to use myChEMBL:
            <ul>
              <li><strong>No Costs</strong> - myChEMBL uses open source tools and libraries, so it removes the expensive licensing costs often associated with similar applications.</li>
              <li><strong>Security</strong> - myChEMBL runs locally behind a users firewall, the normal concerns regarding the submission of sensitive data to web based applications do not apply.</li>
              <li><strong>Application Development</strong> - the source code is available for all myChEMBL applications, so developers can use this as a starting point for applications they wish to develop in the future.</li>
              <li><strong>Non-Technical Usage</strong> - you can quickly get up and running using myChEMBL with no prior programming experience or SQL knowledge. Best place to start is the <a href="/mychembl/app/home.php">myChEMBL Web Interface</a></li>
              <li><strong>Training</strong> - myChEMBL is a great resource for training others how to use tools essential in the field of drug discovery. Feel free to add your own tools and services and use in your own training courses - we would love to hear from you if you do this.</li>
            </ul>
          </p>

          <h4><i class="fa fa-rocket"></i>&nbsp;Who is using myChEMBL?</h4>
          <p>We (the ChEMBL group) are using myChEMBL for training purposes and we are aware of many users who have started using the system. We would like to hear from the community, so if you are using myChEMBL please let us know.</p>
          
          <h4><i class="fa fa-rocket"></i>&nbsp;What is the difference between the <a href="/chemblws/docs/">myChEMBL Web Services</a> and the official <a href="https://www.ebi.ac.uk/chembl/ws">ChEMBL Web Services</a>?</h4>
          <p>Both sets of Web Services use the same codebase and expose the same set of methods to the end user, so they can be considered functionally identical. Please note the official ChEMBL Web Web Services use an Oracle database and the Accelrys Direct chemical cartridge, where as the myChEMBL Web Services use a PostrgreSQL database and the RDKit chemical cartridge. This change may lead to different chemical search results being returned.</p>
          
          <h4><i class="fa fa-rocket"></i>&nbsp;What is the difference between the <a href="/mychembl/app/home.php">myChEMBL Web Interface</a> and the official <a href="https://www.ebi.ac.uk/chembl">ChEMBL Web Interface</a>?</h4>
          <p>The myChEMBL Web Interface is completely independent from the official ChEMBL Web Interface and was developed by Rodrigo Ochoa during an internship with the ChEMBL group. The aim of the myChEMBL Web Interface is to provide users with an application, which demonstrates the chemical search functionality of the RDKit chemical cartridge, without any prior programming or SQL experience. The underlying codebase can be accessed here: <a href="https://github.com/chembl/mychembl_webapp">https://github.com/chembl/mychembl_webapp</a>.</p>
          
          <h4><i class="fa fa-rocket"></i>&nbsp;Do you plan to include the official <a href="https://www.ebi.ac.uk/chembl">ChEMBL Web Interface</a> with future releases of myChEMBL?</h4>
          <p>We have no plans to include the existing ChEMBL Web Interface with myChEMBL, this is mainly due to portability issues. We do plan an update of the official ChEMBL Web Interface and when this does happen it will become part of the myChEMBL distribution.</p>
          
          <h4><i class="fa fa-rocket"></i>&nbsp;Is there a reference for myChEMBL?</h4>
          <p>Yes, please use the following citation:
            <pre class="pre-scrollable">R. Ochoa, M. Davies, G. Papadatos, F. Atkinson & J.P. Overington (2014) 
'myChEMBL: A virtual machine implementation of open data and cheminformatics tools' <em>Bioinformatics</em> <strong>30</strong> (298-300) (<a href="http://doi.org/10.1093/bioinformatics/btt666">pdf</a>)</pre>
          </p>

          <h4><i class="fa fa-rocket"></i>&nbsp;What are the future plans for myChEMBL?</h4>
          <p>myChEMBL is a project which is still evolving so expect new tools to included with each new release. Please let us know of any tools and services you would like to see included in future myChEMBL releases.
          </p>
                    
          <h4><i class="fa fa-rocket"></i>&nbsp;Are there any acknowledgements?</h4>
          <p>Yes, we thank the people involved in the following projects, whose software, tools and libraries are used to help build the myChEMBL Virtual Machine and related applications. We have made every effort to acknowledge everyone involved, but please get in touch if your acknowledgement is missing from the list below.</p>
          <p class="mychembl-acknowledge text-center">
            <span><a href="http://www.rdkit.org/"><img src="/assets/img/rdkit.png" /></a></span>
            <span><a href="http://www.postgresql.org/"><img class="ack-logo-width" src="/assets/img/postgresql.png" /></a></span>
            <span><a href="http://ipython.org/"><img class="ack-logo-width" src="/assets/img/ipython.png" /></a></span>
            <span><a href="http://www.knime.org/"><img class="ack-logo-width" src="/assets/img/knime.png" /></a></span>
            <span><a href="http://peter-ertl.com/jsme/"><img class="ack-logo-width" src="/assets/img/jsme.png" /></a></span>
            <span><a href="http://phppgadmin.sourceforge.net/"><img class="ack-logo-width" src="/assets/img/phppgadmin.png" /></a></span>
            <span><a href="http://www.ubuntu.com/"><img class="ack-logo-width" src="/assets/img/ubuntu.png" /></a></span>
            <span><a href="https://www.virtualbox.org/"><img src="/assets/img/virtualbox.png" /></a></span>
            <span><a href="http://www.vmware.com/"><img class="ack-logo-width" src="/assets/img/vmware.png" /></a></span>
          </p>
        </div>
      </div>

<? include "footer.php"; ?> 
      
/*!
 * Start Bootstrap - Freelancer Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('.page-scroll a').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Floating label headings for the contact form
$(function() {
    $("body").on("input propertychange", ".floating-label-form-group", function(e) {
        $(this).toggleClass("floating-label-form-group-with-value", !! $(e.target).val());
    }).on("focus", ".floating-label-form-group", function() {
        $(this).addClass("floating-label-form-group-with-focus");
    }).on("blur", ".floating-label-form-group", function() {
        $(this).removeClass("floating-label-form-group-with-focus");
    });
});

// Highlight the top nav as scrolling occurs
$('body').scrollspy({
    target: '.navbar-fixed-top'
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});

// Remember chosen OS
$(function() {
    var chosen_os = null;
 $('.oses .portfolio-link', '#install').click(function(){
     $('.oses .portfolio-link', '#install').removeClass('selected');
     var classes = $(this).attr("class").split(' ');
     for(var i = 0; i < classes.length; i++){
         if (classes[i]!="portfolio-link"){
             chosen_os = classes[i].toLowerCase();
             break;
         }
     }
     if (chosen_os){
         $('span.command').text(function(){
                 var ret = $(this).text();
                 ret = ret.replace('ubuntu', chosen_os);
                 ret = ret.replace('centos', chosen_os);
                 return ret;
             }

         );

         $('a.download-link').each(function(){
            if(chosen_os == 'centos')
                this.href = 'http://ftp.ebi.ac.uk/pub/databases/chembl/VM/myChEMBL/releases/myChEMBL-20_0/CentOS/VirtualBox/centos.vmdk.tar.gz';
            else
                this.href = 'http://ftp.ebi.ac.uk/pub/databases/chembl/VM/myChEMBL/releases/myChEMBL-20_0/Ubuntu/VirtualBox/ubuntu.vmdk.tar.gz';
         });
     }
     $(this).addClass('selected');
 });
});

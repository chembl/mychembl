## myChEMBL branding

# Bootsplash


	1. mkdir /usr/share/themes/mychembl
	2. Copy the mychembl.png file there
	3. sudo vi /etc/default/grub and add the line:
		GRUB_BACKGROUND=“/usr/share/themes/mychembl/mychembl.png”
	4. sudo update-grub
		
A new grub config should be displayed, informing you that it’s found the image. If not, check the path and image format.


# Console

Nothing fancy, just modifying the Plymouth console config to change colours and text:


	[Plymouth Theme]
	Name=Ubuntu Text
	Description=Text mode theme based on ubuntu-logo theme
	ModuleName=ubuntu-text

	[ubuntu-text]
	title=myChEMBL 19
	black=0x207a7a
	white=0xafeeee
	brown=0x70bdbd
	blue=0x7cd17c

This lives in:

	/lib/plymouth/themes/ubuntu-text.plymouth

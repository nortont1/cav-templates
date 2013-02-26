{% extends "gryphon/base.tpl" %}
{% block title %} :: RSS Feeds{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}


{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
	<div class="row">
		<div class="span8">
			<h1>Advertising</h1>

			<hr class="spacer" />

			<p>
				If you're a local advertiser, please download our <a href="http://www.cavalierdaily.com/wp-content/uploads/2011/09/local-media-kit-11-12.pdf">local media kit</a> or our <a href="http://www.cavalierdaily.com/wp-content/uploads/2011/09/local-rates-11-12.pdf">local rate card</a>.<br />
				If you're a national advertiser, please download our <a href="http://www.cavalierdaily.com/wp-content/uploads/2011/09/nationals-media-kit-11-12.pdf">national media kit</a> or our <a href="http://www.cavalierdaily.com/wp-content/uploads/2011/09/nationals-rates-11-12.pdf">national rate card</a>.<br />
				If you're a non-profit, please download our <a href="http://www.cavalierdaily.com/wp-content/uploads/2011/09/nonprofit-media-kit-11-12.pdf">non-profit media kit</a> or our <a href="http://www.cavalierdaily.com/wp-content/uploads/2011/09/nonprofit-rates-11-12.pdf">non-profit rate card</a>.
			</p>

			<p>
				For our production dates, please download our <a href="http://www.cavalierdaily.com/wp-content/uploads/2011/09/production-calendar-11-12.pdf">production calendar</a>.
			</p>

			<p>
				To place a classified ad online or in our print edition, use our <a href="{{ 'classifieds'|url }}">online classified ad system</a>.
			</p>

			<hr class="spacer" />

			<h3>Overview</h3>

			<p>
				Serving the University of Virginia since 1890, The Cavalier Daily remains students’ primary source of local, state and national news. Every day The Cavalier Daily offers solid reporting and standout editorials in the interests of the University community. But we also offer diverse content that appeals to broad audiences. Our Life features, movie and music reviews, and coverage of both men’s and women’s sports are regarded by professional associations as among the best in Virginia.
			</p>

			<p>
				The Cavalier Daily is delivered five days a week during the school year to over 80 sites on Grounds and throughout Charlottesville and Albemarle County. According to independent surveys, every day over 80 percent of U.Va.’s student body – pick up a free copy of our paper.
			</p>

			<p>
				The Cavalier Daily prides itself on being accessible to the community. The advertising department is no exception. Our staff is personable and attentive to detail. Everyone at the paper strives to be flexible to the customer’s needs. If your business, organization or charity requires the University’s attention, The Cavalier Daily remains the easiest and most thorough medium for delivering your message. We look forward to working with you.
			</p>

			<hr class="spacer" />

			<h3>PayPal</h3>

			<p>
				The Cavalier Daily accepts credit card payments online via PayPal. You do not need a PayPal account to process your payment. When you are on the PayPal page, please enter the amount on your invoice for the item price.
			</p>


			<form
			action="https://www.paypal.com/cgi-bin/webscr" method="post"> <input
			type="hidden" name="cmd" value="_s-xclick"> <input
			type="hidden" name="hosted_button_id" value="3C336Q4Y5DBE8"> <input
			type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!"> <img
			alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1"><br
			/></form>

			<hr class="spacer" />

			<h3>Contact Us</h3>

			<p>
				Advertising Office – <a href="mailto:ads@cavalierdaily.com">ads@cavalierdaily.com</a>, 434-924-1085<br />
				Advertising Manager – Sean Buckhorn, <a href="mailto:ads@cavalierdaily.com">ads@cavalierdaily.com</a>, 434-924-1085<br />
				Chief Financial Officer – Anna Xie, <a href="mailto:cfo@cavalierdaily.com">cfo@cavalierdaily.com</a>, 434-924-1084
			</p>


			<hr class="spacer" />

			<h3>Dimensions</h3>

			<p>
			All camera-ready ads must be designed to the reserved size to ensure accurate reproduction. The Cavalier Daily reserves the right to adjust any advertisements that are not prepared to the correct measurements of the reserved size. Horizontal measurements are based upon the column widths as described below. All vertical measurements are in standard inches.
			</p>

			<ul>
				<li>1 column = 1.8 in.</li>
				<li>2 columns = 3.8 in.</li>
				<li>3 columns = 5.7 in.</li>
				<li>4 columns = 7.7 in.</li>
				<li>5 columns = 9.6 in.</li>
				<li>6 columns = 11.6 in.</li>
			</ul>

			<hr class="spacer" />

			<h3>Display Advertisement Rates</h3>

			<p>
				All display rates are listed per “column inch” (see Dimensions for precise measurement). All prices are on a per day basis. The dimensions for several common sizes have been provided below, but ads may be purchased in any custom size, increasing by columns horizontally and inches vertically. All display ads must be at least 2 column inches in size.
			</p>

			<p>
				The Cavalier Daily is a “broadsheet” newspaper, 6 columns x 21 inches. Some special supplement issues are in “tabloid” format, 5 columns x 11 inches.
			</p>

			<p>
				Any advertisement more than 17” in length will be charged as 21” in a broadsheet issue. Any advertisement more than 8” in length will be charged as 11” in a tabloid issue.
			</p>

			<p>
				Non-Profit...............$8.00<br />
				Available for student organizations and other non-profit groups.
				<br /><br />
				Local.......................$10.00<br />
				All advertising by Charlottesville and Albemarle County businesses.
				<br /><br />
				National..................$17.00<br />
				All advertising by businesses outside of the Charlottesville and Albemarle County area.
			</p>

			<hr class="spacer" />

			<h3>Classified Advertisement Rates</h3>

			<p>
				$4.00 minimum, 15 words or less<br />
				$.25 for each additional word<br />
				Classified ads are placed on The Cavalier Daily website at no additional charge.<br />
				Classified ads must be prepaid and submitted through our <a href="{{ 'classifieds'|url }}">online submission system</a>.
			</p>

			<hr class="spacer" />

			<h3>Payment</h3>

			<p>
				Individual invoices will be generated for each display advertisement that runs in the paper. A full-page tear sheet will be mailed with the invoice. Monthly statements can also be generated upon request. Payment can be made by cash or check. The Cavalier Daily can also accept credit card payments. To pay by credit card, call the Advertising Department during its office hours, Monday through Friday from 10 a.m. to 12 p.m and 2 p.m. to 4 p.m.
			</p>

			<p>
				The Cavalier Daily reserves the right to charge a 1.5% interest charge per month on all past due balances.
			</p>

			<hr class="spacer" />

			<h3>Proofs</h3>
			<p>
				Proofs will be furnished upon request. Advertisers must request proofs three days prior to the ad’s run date. Only changes for typographical errors may be made after the reservation deadline for an ad. Proofs can only be provided by fax or by appointment in The Cavalier Daily offices.
			</p>

			<h3 class="spacer" />

			<h3>Tearsheets</h3>
			<p>
				Tearsheets will be furnished upon request for proof of publication for display advertising. Complete issues may be requested by non-local advertisers based on availability. Tearsheets will not be provided for classified advertisements. The advertising manager reserves the right to deny excessive tearsheet requests.
			</p>

			<hr class="spacer" />
			<h3>Color</h3>
			<p>
				Full Process Color: $350<br />
				Spot Color: $150 per color
			</p>

			<p>
				Prices for color are per ad per day, regardless of ad size. Charges for color are in addition to the price of the ad space.
			</p>


			<p>
				Prices for spot color only apply to red, blue, orange, or green. (Please see color swatches for approximate printing hues.)
			</p>


			<p>
				All Pantone Matching System (PMS) colors and custom spot colors will be printed using four color full processing and will be assessed the full process color fee.
			</p>

			<p>
				Please see Ad Submission for color ad file specifications.
			</p>

			<hr class="spacer" />

			<h3>Ad Preparation</h3>
			<p>
				Pre-designed advertisements are preferred; however, basic typesetting and layout is included in the cost of an ad. Scanning of logos and images and access to The Cavalier Daily clipart directory are provided at no additional cost. Please see Policies for deadline information regarding ads designed by The Cavalier Daily staff.
			</p>

			<p>
				The Cavalier Daily reserves the right to charge a design fee for elaborate or time-consuming design work. Design fees will be assessed at the discretion of the advertising manager and will be stated before any design work is completed.
			</p>

			<hr class="spacer" />

			<h3>File Formats</h3>

			<p>
				The Cavalier Daily uses Macintosh computers to produce ads. Although we can read most Windows file formats, there is a lower chance of compatibility problems if ads are supplied as Mac files.
			</p>

			<p>
				Acrobat PDF files are preferred, since PDF format embeds all graphics and fonts into a single, complete file. We can also accept files converted to TIFF or EPS format. The Cavalier Daily performs design and layout in Adobe InDesign, Illustrator, and Photoshop. We can accept files in these programs, but they frequently require font substitution and reformatting. Substantial redesign of incompatible files may be subject to additional production charges.
			</p>

			<p>
				We cannot accept any Microsoft Office (Word, Excel, PowerPoint, etc.) or Quark files. If you create content in these programs, please convert your ad to a PDF before submitting.
			</p>

			<p>
				Generally, web file formats, such as GIF and JPEG, will not reproduce well in print and are not preferred.
			</p>

			<hr class="spacer" />

			<h3>Resolution</h3>
				<p>
				Photographs in ads submitted electronically should be screened at 85 lpi.
			</p>

			<hr class="spacer" />

			<h3>Fonts</h3>
			<p>
				If you are submitting a file in PDF format, please ensure all fonts are embedded when the PDF file is created.
			</p>

			<p>
				If you are submitting a file in any other format, we can not guarantee that the exact fonts will be available. The Cavalier Daily reserves the right to make any font substitutions for fonts that are not embedded in the ad.
			</p>

			<hr class="spacer" />

			<h3>Color</h3>

			<p>
				Process color ads are printed using CMYK colors.
			</p>

			<p>
				For any ad printed in Spot color, you must specify in your design application that the color type is “Spot Color” instead of “Process Color.”
			</p>

			<p>
				We cannot adjust colors in PDF or EPS files. Please convert any color text or graphics from RGB to CMYK.
			</p>


			<hr class="spacer" />

			<h3>Delivery Methods</h3>

			<p>
				Electronic submission of ads is preferred. Ads may be e-mailed or submitted on Zip disks. Ads can also be downloaded from Web or FTP sites.
			</p>

			<p>
				Camera ready ads up to 8.5 x 11” are also acceptable. Artwork and logos should be clean, original copies on white paper. Photos for camera-ready ads should be screened at 85 lpi.
			</p>

			<p>
				All camera-ready ads will be scanned at a high resolution, although we can not guarantee that the quality will be the same as the original.
			</p>

			<p>
				To send an ad via e-mail, compose a text message with the following information: name, address, phone number, the ad size and run dates. Make your ad a separate Attachment to your text message, and e-mail to: <a href="mailto:ads@cavalierdaily.com">ads@cavalierdaily.com</a>
			</p>

			<p>
				The Cavalier Daily reserves the right to make any necessary changes to ensure compatibility and best possible output.
			</p>



		</div>
		<div class="span4">
			{% include 'gryphon/main/sidebar/default.tpl' %}

		</div>
	</div>
{% endblock content %}

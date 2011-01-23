<h1>Contact Us</h1>
<c:form action="send">
	<c:fieldset label="Send us your thoughts">
		<c:input name="name" label="Your name" />
		<c:input name="email" label="Your email address" instructions="Will not be displayed or published" />
		<c:textarea name="message" />
	</c:fieldset>
	<c:buttons>
		<c:submit label="Submit" />
	</c:buttons>
</c:form>
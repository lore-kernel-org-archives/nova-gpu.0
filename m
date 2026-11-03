Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664891;
	b=QBJl6NLeR5g864s/rZq7pvZ/Om3+TUr1zX7yF1mO5QXzK5piLOR5XC7v1vVJotjBjy3v
	 KtYILK2Dh6AQp8+JyotVAtK0909JkzTwrt9n7oReDcK2BZj8sgnycPXTcPGZp7WEMQqzV
	 krFM8YgLbgbl6xXeT5p58f7vIc9rOi7QadldYO61oELi+hARjGw2b3egKJ0mLg4fz0veJ
	 RGkaL2S/GLTdVeYIMPj60Tj2f3BzTHN3xj6JcvwYYSb+pteYgJcU03MrBVi8qm4koe4Kq
	 O3wabI/ZdyuFmFMtmtAgy31hIIurWQlswxkKnlE7wxSsMhsVzaElAmrKjfpZP233YVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664891;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MbjkDPQk0zB4IT2QwWLAcutfUEqZ4J13V6xQxvyiL0g=;
	b=uG5RqznE5z9O8l5pNiFj0BsWS86USUMYcnpmH81YqyHsdVEMv0F5QWyOlNngxKUsYnM7
	 40JjUJLgNN/vyWSWAfqtYkpGkAgI6XFGJOAwm4ERRZqKvrmbHyLSC9LUDh2AcSaASGKi1
	 fbtcXhJufjDDthbWk+DNt/kmV5T1Iq/pTjbCIZEqHELu1pibd8hHag9Gc1GEV9DOD1svD
	 K7b59hrZPcvDPcNcH17lMrQ00NiHCZ8LVeJm674wDVLspSK73KwwTYffoHRENvZCPTwIE
	 oXIcZYgtxDnwZL5AdMLFp24kT2WaBa7pmb4PJCBMYwmXgDlY6JyuDfDWbrek6CbMNOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EowjhSZX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B63606A324
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 00:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EowjhSZX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C501F000C1;
	Tue,  3 Nov 2026 00:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793664891;
	bh=MbjkDPQk0zB4IT2QwWLAcutfUEqZ4J13V6xQxvyiL0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EowjhSZX3WxgYtbwOzjCv4V6bwH6TEtyB45EntqjzS4D8zaoNlqi1dt2ZTEzJMa3/
	 z+CxszmVAU992oqeQSI1GszkbGrvHvZfxi3emDvJGA97GtOXFOslJ4uGkNIHefh3DX
	 Y28w0JJdwGFecNT92cBf4KIy10aJ80VARNT4qw21JN+t8AnWyKVD6Fn+yEHTj/Dvj6
	 9QtXjchf2bda1jJANOlUgQGXwHcyi3fzRjq4FQEVgE52MSd/i3NBziOId7UgMRg757
	 SDzBhuyLdEKXeGA+CWwxcAX81AJC1hfTyJKzHRri6BRY98EXLelvFEd92gNmVprQVg
	 BTlnaFQ1HctFA==
Message-ID: <sashiko-outbox-194366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] gpu: nova-core: gsp: cmdq: add the GMC receive path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, ojeda@kernel.org
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-4-189f9ff3bfd2@nvidia.com>
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
 <20261103-r000_rebase_on_cmdq-rpc-v1-4-189f9ff3bfd2@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 00:14:50 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpu: nova-core: gsp: type mismatch in CmdqInner::send_gmc_command()
- [Medium] gpu: nova-core: gsp: unclaimed replies passed to on_event in awa=
it_gmc_reply()
--

commit 54e27415bb52450de6eeae48a370384ffd8a7d77
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: gsp: cmdq: add the GMC receive path

This commit adds the receive side of the GMC sub-module in nova-core so the
driver can parse GMC messages, handle GMC events, and wait for GMC command
replies from GSP-RM.

> diff --git a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs b/drivers/gpu/nova-cor=
e/gsp/cmdq/gmc.rs
> index b035f30479a84..9adba5cbcd5c8 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs

[ ... ]

> @@ -150,7 +152,167 @@ fn write(&self, dev: &device::Device, seq: u32, dst=
: &mut GspCommand<'_>) -> Res

[ ... ]

> +    ///Logs an event, meaning a message that no caller was waiting for.
> +    ///
> +    /// A reply that nobody claimed (e.g. one that arrived after its req=
uest timed out) and an
> +    /// unknown command id are logged at warning level. Other events are=
 not logged.
> +    pub(super) fn log(&self, dev: &device::Device) {
> +        let command =3D self.header.command();
> +        let seq =3D self.header.sequence();
> +
> +        match command.id() {
> +            Ok(id) if command.is_response() =3D> {
> +                dev_warn!(dev, "unclaimed GSP GMC reply to {:?} (seq {})=
\n", id, seq);
> +            }
> +            // Nothing to do for the remaining known command ids.
> +            Ok(_) =3D> {}
> +            Err(_) =3D> {
> +                dev_warn!(dev, "unknown GSP GMC command {:?} (seq {})\n"=
, command, seq);
> +            }
> +        }
> +    }
> +}
> +
>  impl Cmdq<'_> {
> +    /// Sends `command` to the GSP and waits for the reply.

[ ... ]

> +    pub(crate) fn send_gmc_command<C>(
> +        &self,
> +        command: C,
> +        on_event: impl Fn(&GmcMessage<'_>) -> Result,
> +    ) -> Result<C::Reply>
> +    where
> +        C: CommandToGsp,
> +        C::Reply: MessageFromGsp,
> +        Error: From<C::InitError>,
> +        Error: From<<C::Reply as MessageFromGsp>::InitError>,
> +    {
> +        let mut inner =3D self.inner.lock();
> +        let seq =3D inner.send_gmc_command(command)?;
> +
> +        inner.await_gmc_reply(seq, on_event)
> +    }
> +
>      /// Sends `command` to the GSP without waiting for a reply.
> @@ -191,4 +353,70 @@ fn send_gmc_command<C>(&mut self, command: C) -> Res=
ult<u32>
>      {
>          self.send_command_element(GmcCommandElement(command))
>      }

[Severity: High]
Does CmdqInner::send_gmc_command() compile and return the sequence number as
expected here?

Cmdq::send_gmc_command() calls inner.send_gmc_command(command)? to obtain
seq: u32 and pass it to inner.await_gmc_reply(seq, on_event). However,
CmdqInner::send_gmc_command() returns the result of
self.send_command_element(GmcCommandElement(command)), and in
drivers/gpu/nova-core/gsp/cmdq.rs, CmdqInner::send_command_element() has
return type Result (i.e. Result<(), Error>):

drivers/gpu/nova-core/gsp/cmdq.rs:CmdqInner::send_command_element() {
    ...
        let elem_count =3D dst.header.element_count();
        self.seq +=3D 1;
        self.gsp_mem.advance_cpu_write_ptr(elem_count);
        Cmdq::notify_gsp(self.bar);

        Ok(())
    }

Because rustc type-checks generic function bodies even when unused, won't
this fail to build with a mismatched types error (expected Result<u32, Erro=
r>,
found Result<(), Error>) unless send_command_element() or send_gmc_command()
returns the sequence number of the sent element?

> +
> +    /// Receives the reply of type `R` to the command sent with sequence=
 number `seq`, waiting up
> +    /// to [`Cmdq::RECEIVE_TIMEOUT`] from the call.

[ ... ]

> +    fn await_gmc_reply<R: MessageFromGsp>(
> +        &mut self,
> +        seq: u32,
> +        on_event: impl Fn(&GmcMessage<'_>) -> Result,
> +    ) -> Result<R>
> +    where
> +        // This allows all error types, including `Infallible`, to be us=
ed for `R::InitError`.
> +        Error: From<R::InitError>,
> +    {
> +        let dev =3D self.dev;
> +
> +        self.await_msg_with(|message| {
> +            let gmc_message =3D match message {
> +                GspParsedMessage::Gmc(gmc_message) =3D> gmc_message,
> +                _ =3D> {
> +                    message.log(dev);
> +                    return Err(ENOMSG);
> +                }
> +            };
> +
> +            match gmc_message.is_reply_to(R::COMMAND, seq) {
> +                // Message is not the reply to our command, log it.
> +                None =3D> {
> +                    on_event(&gmc_message)?;
> +                    return Err(ENOMSG);
> +                }

[Severity: Medium]
When gmc_message.is_reply_to(R::COMMAND, seq) returns None in
CmdqInner::await_gmc_reply(), can an unclaimed GMC reply to an earlier
command or an unknown GMC command be passed to on_event() instead of being
logged?

In drivers/gpu/nova-core/gsp/fw.rs, GmcCommandWord::is_response() is set on
responses to requests and not set on events, and GmcMessage::log() checks
command.is_response() and command.id() to log unclaimed replies and unknown
commands at warning level.

Here, the comment says "Message is not the reply to our command, log it.",
but the None arm calls on_event(&gmc_message)? without checking whether the
message is a response or calling gmc_message.log(dev) (which is pub(super)
and not callable from outside the cmdq module). Should unclaimed responses
be logged via gmc_message.log(dev) rather than forwarded to on_event()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-r000_rebas=
e_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com?part=3D4

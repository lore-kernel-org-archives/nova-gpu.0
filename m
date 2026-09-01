Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DDF353A95;
	Tue,  1 Sep 2026 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247779; cv=none; b=cBkSCvkxflG6oii3Eu/BzN2f+UEMXfOlhO0tAqqMnxE1A5WUjRJ9JRAezn1THMfbVxf93QXxKFbCRx5eOBVa96ROiX+mAO/ZD6hmzBq21PMgBsaMfNvmd7ejkFcfwlnRAB74uLriRYld0j6v43Yj7qrF1HpeNALUZV4W+vDBF8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247779; c=relaxed/simple;
	bh=0BeQ1jcJ81wB0BbZws3P6OK2faSL42i3Ig/Swxc9Jm4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Fx88qHqvI/4eZZL1mPdpZHbqJQ0n466MsQSzwmKpBSOwsPM7xj5snnfpXeybJ7xxcdpVTe6e9IHweEerDE17bQTKzLHKPKdwBfCgmjGoRre7D8pGoktjKbNidStzsCS75qVumEnd3M/LxYj5HpPO6IavNX8yYYo6qlVzGPt8E94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcCzE8dO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcCzE8dO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5E01F000E9;
	Tue,  1 Sep 2026 07:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788247778;
	bh=0BeQ1jcJ81wB0BbZws3P6OK2faSL42i3Ig/Swxc9Jm4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=WcCzE8dOHxQjet/A/NFJPQ8P79lzQdE+R+ucBc6+IiJIwvLuLIDVtTHTBnlxgPYc/
	 eJnRdejwW7z8WrDghv9P9cfPucBg6pMwi4tU8Cz4uiGSQLSTeIZlLSh/+8hDcol2qi
	 Skqbspvadr1t6eaKrbhuIpW7n36fI2JpWQW9DNhway2zQtqgrrsmYElKzXX4Eng0lq
	 4Wnevx2Ohu9YhDmXfb+UJrA79TH1RnZOphm2S+2AnKMWNo/idMC2Waxl+9D/yCHQhC
	 kE1Ubmwupspe2/padQPSBTDMNzLIMI5nH0VNrpONO7cf584L1Cp0X9Q76Jw1z6kIh8
	 F47UpstDf23kA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 09:29:34 +0200
Message-Id: <DL3SXIIA4FID.2V3K5YC91RM3V@kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>, "Dave Airlie"
 <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "M Henning"
 <mhenning@darkrefraction.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org>
 <apZCTUYiN5FHCkCm@nvdebian.thelocal>
 <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
 <apZbKc5xMQ1yTBTu@nvdebian.thelocal>
In-Reply-To: <apZbKc5xMQ1yTBTu@nvdebian.thelocal>

On Tue Sep 1, 2026 at 7:09 AM CEST, Alistair Popple wrote:
> On 2026-09-01 at 14:50 +1000, Dave Airlie <airlied@gmail.com> wrote...
>> > >
>> > > We should make the NovaCoreApi just provide an accessor for &Spec an=
d make every
>> > > subsequent method we need public. Otherwise we end up with endless f=
orwarding
>> > > methods. We can also add as_raw() methods to the specific types as n=
eeded.
>> >
>> > Ok. This is where I don't have a good instinct for what we think shoul=
d be an
>> > accessor/forwarding method vs. where we should just expose the underly=
ing data
>> > structure and required methods to API users.
>> >
>> > In the past it seems there's been some resistance to exposing nova-cor=
e or gsp
>> > data structures like this which is why I added the forwarding methods.=
 In future
>> > we're going to have other data-structures that NovaCoreApi will need t=
o access
>> > so it would be good to understand what we should do here so we can kee=
p things
>> > somewhat consistent.
>>=20
>> We can expose structure defined in nova-core, we cannot expose
>> structures defined in gsp bindings or firmware.

Yes, those structures are not even exposed to the nova-core layers we are
dealing with here.

There are the structures abstracting firmware interfaces, but despite expos=
ing
trivial cached values, they should not exposed to nova-drm either.

Instead nova-drm should call into nova-core and ask it to do things on its
behalf.

More in general, the same is true for any other device resources. For insta=
nce,
we also should not expose the pci::Device or the pci::Bar to nova-drm, but =
again
provide a higher level API.

> All the fields of self.gpu are structures defined as rust native structur=
es in
> nova-core. Their values may be decoded or derived from GSP responses, but=
 by
> design none of the raw structures from gsp bindings live in self.gpu AFAI=
K.

We could indeed expose all values from struct Gpu directly and control
everything through visibility, but ...

>> In theory we can internally between core/drm but I'd really really
>> like to keep that boundary as the limits of GSP for auditability
>> purposes.

... exposing struct Gpu and controlling everything through visibility still
means that we could easily miss some device resource being exposed directly=
 to
nova-drm, which also includes GSP abstractions.

So, I think we should provide accessors for the major structures that we
intentionally want to expose (so we have an obvious boundary), but not for =
every
single fields inside them.

This is also why I said that we can expose an accessor for struct Spec, whi=
ch I
think serves as a good example.

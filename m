Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653192;
	b=4X75XlhZGy645Jhls/+35yA7qYIMvKpYHUdIQ/Y+hjpgmXCDH70SYzGeJpi14655hhnC
	 bEDegGlMnMJk9aAbz49pM0yQMwQ9LZn0rSo9gedGdcYLBCclrcv3U6AUlSHoKLWHW7Bz7
	 8c/N9XnF8lRcNd1/W2LaHNYI0dQD+BTaiKf1rrKtXaWeNyIxIEIULA/Jtov3wANHJAzpr
	 O6JSl5pcKMsWcI52LLa7p1d/OJJTzifXgiFficVzHyZ8DZVQR7YibJdHrf41xPwwOGoSc
	 JyAiMliFGKztsaww6SSdhKU/k2m+F5jCEaJuGMebeARR94ZoTT5LylzhYBInmocO/UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653192;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=8pIzqjiV/StT7AHcIrYh5KJvxuCIG6PlfMWhHLglXYw=;
	b=vCrPwVuT/vbGszFx/W3trikXF5++ihaNJHihk5MqsRFQ1oYUOLfgPgFxdbJDj4WbAmTQ
	 9ggyqnqn1kgdx98evGWutnx/04QMXlGvVVWYzESLBUFk8aVKC3dwHCE7o4qUp0WNGs0Tm
	 db4rv6GJ/WMW+EXc7ygznW/tkEqOafnd8xPXsiWE2hAqmSQhpBn6ArQWVldgRga9dUNsy
	 wQM11OtSojPZ0julf56AlliE7KbHC9adjCvDriSEWE146wUPCMFdzJm+op8jqvSkZDeKh
	 cram4SXR0t0H0WkC0Wiabg0wyC8v9Fx/1Hms/wqtHhJKHV4gew66OfAqX4+JPKm+aCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="akq8/ulw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C14606A31E
	for <nova-gpu@lists.linux.dev>; Thu, 26 Nov 2026 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akq8/ulw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C1F1F000C6;
	Thu, 26 Nov 2026 00:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653191;
	bh=8pIzqjiV/StT7AHcIrYh5KJvxuCIG6PlfMWhHLglXYw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=akq8/ulwNlgdA0bhzr8EInShYXOdCDGAGHFspNfhQ/7K3qYCbpW/GSxjcD2rCr3L5
	 VNi7arUPwuomzIxH/zvC0y+El42ptroMpAIU+RRDLNGFqgq1igfTYBf8Fr4K+QxRM/
	 xukKesZwfNwGVfLC9Exdee0kR8zv9dlbKmOd/rim31Q184PMzsTjfkLteRWrEC9VY+
	 UTfuG4JVm8PT/c05MQhl9QBUWVIWKQq0eDgy377aTjCn95CP7QEtM6gB9i8be7YYMJ
	 mwo+YkQLTgKRMeUgAZO6waWln1d/sJ2dp790BiG9jJBjuDPKkTtz3VSNNzNzJPL0WL
	 FHn/IRe158mlw==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 01:33:08 +0100
Message-Id: <DN4PXIYXRY4O.1FKD2ELMKOUEK@kernel.org>
Subject: Re: [PATCH v3 1/2] drm/nouveau: add option to leave GSP-capable
 GPUs to other drivers
Cc: <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <nova-gpu@lists.linux.dev>
To: "M Henning" <mhenning@darkrefraction.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
 <20261124-nova-nouveau-gsp-v3-1-e1440479ded6@redhat.com>
 <CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com>
In-Reply-To: <CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com>

On Wed Nov 25, 2026 at 5:43 AM CET, M Henning wrote:
> On Tue, Nov 24, 2026 at 12:50=E2=80=AFAM Dave Airlie via B4 Relay
> <devnull+airlied.redhat.com@kernel.org> wrote:
>> +config DRM_NOUVEAU_BIND_GSP
>> +       bool "Make nouveau the default driver for GSP-capable GPUs"
>> +       depends on DRM_NOUVEAU
>> +       default y
>> +       help
>> +         Make nouveau bind to all NVIDIA GPUs by default, as it always
>> +         has.
>> +
>> +         If another NVIDIA driver, such as nova-core, should claim the
>> +         GSP-capable (Turing and later) GPUs instead, say N here; nouve=
au
>> +         then leaves those GPUs alone and continues to bind to pre-Turi=
ng
>> +         GPUs itself. nouveau can also be prevented from binding to
>> +         GSP-capable GPUs at boot with nouveau.bind_gsp=3D0 on the kern=
el
>> +         command line.
>> +
>> +         If unsure, say Y.
>
> Maybe the documentation should make this option sound a little
> scarier? Right now all this does is break nouveau (unless you're a
> nova developer),. We really don't want users or distros turning it on.

I assume you mean turning it off; turning it on (which is the default) shou=
ld
not cause any trouble. It has some rough edges though, which is why I sugge=
sted
[1] instead.

[1] https://lore.kernel.org/nova-gpu/DN3F7521O232.LXJ8JBRTSTPQ@kernel.org/

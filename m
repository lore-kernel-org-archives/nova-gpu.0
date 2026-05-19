Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA337CD4F
	for <nova-gpu@lists.linux.dev>; Tue, 19 May 2026 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217351; cv=none; b=GHe4qynUY9wPq4/8ZduvrV5VVtr0ewbcxrM/LLnNM94oYNcIblD9+oQ82JND96p0uBGOUrbewzHDvhYrcP/arDReFK5TlCer60P3VzZvMHSGRhQNYOArO33uoe5FBidV+rpKB9j8UKksiPGPdDZWGSizeiMYKlFcSaDD/kx7ALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217351; c=relaxed/simple;
	bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KrKDW1Loz8cGwVTX+A2HbSS7LmW1CqC+GaMsdOvoESL9SdA4ge7tQj17GjajGtzF+x4+ZDyNyWTjE62IYjxylUBmEW5TtHlmO46eB5gcwXZETA3OfkBI1cliWXmWS5qwTNCv4uAs72ncstfBaWH1omFbTRP+mRjKUt9LFKNbr78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TXgEEspA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TXgEEspA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779217349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
	b=TXgEEspAQ6qo99NbHgrvMXy/YxjiTPMS/mkeozPHksc3Oap0j3n04/Tw4kBXctPVhNAZvG
	8hQI3x0Z52uQjJw++ogiM0IMtobmyVNrIoSHYlD1ptsEvjPYkAh8PMi8vBLDd3qGggDjEg
	5lV0pvOtRU6jlmih/8D4XCdelYHLH5k=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-ZNp0x9ZXNdGRs_ipJ5ByyQ-1; Tue, 19 May 2026 15:02:14 -0400
X-MC-Unique: ZNp0x9ZXNdGRs_ipJ5ByyQ-1
X-Mimecast-MFC-AGG-ID: ZNp0x9ZXNdGRs_ipJ5ByyQ_1779217334
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1329791f18fso6805633c88.1
        for <nova-gpu@lists.linux.dev>; Tue, 19 May 2026 12:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217334; x=1779822134;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
        b=S/Mjp/RqvwCcEmHV7SbF9Q70fkjAldGg2waH0HcZDhPQN36hYyqPmSbGzfcS2NMZGP
         CJr8WlGD8Ts6P9UyJOX8DtTnU35jFQUsDDjFh0FB0YGTuQa0d4PezzTeKKubqY8loglZ
         nylt+dNrZKMDTHDKRlHk/RZHzxcFxVzZ3B7GB4LQcormnLZ3itfLiAyh1oilMZ2yXhuP
         8zzsHGv2/8LYIyUzVWPSHaRq0Rt2pil2ieoqFb3b0FpNBip1XPgxiBXTj0MCocK6hRk9
         WxVcDFTQ3TrzP6DmKVvQut1x8Jd0UCfgyBi+rd5w90uI62pN/JBFuqXB+1IW/Eg25F50
         /ZZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PuTf4GXkwAbHqBdxCyZzMTHgrz1HLgrwMJrcbhmjKhGGIQRg7YBAGu2wz6kZr1SJZ+Q8rdv6Cig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOvsIAeo/1Y99Fyihs8UB3l4yzR8ZuLVBqKP1hDVt7ahQtBXK+
	SvgYR6bZVsVRj9ikYJUWY8FN9H8ZUTXZ6zl+ZIRjrFDtH3iIVUq5D2Y6GZ6JrQyvZ7M4ECh+0ZT
	y5KRHDYSo3ybx6rrw6HWLQuITvxiquvHWZsu5KvnlMB/il8DJ1WfvNu1bt90D
X-Gm-Gg: Acq92OHXSYZRsH8di0Vxcrv3AoFNu2Z06kniqD2bBUwcCogdUwzEatkl4aE4EtvmPCh
	N8STfVSuD+LLddrYac1b8YUkZZpbq6YMPGHe4KxeYYwjfOVQaxut416ZDktOqUDXcwaRqFBzTe1
	NHZFuF70yi49ILRArgqCINotF/d4x9zpu8cu3ATeG7AKRVNVy1nzZRBRYmSHKU2LLmVHF4G3gWS
	Ovvn29m88OuPA2D+2Z20n5QIR1ElEYbNDiFHvOM8R8GfYqH/inhd/wpex3v/seGbHV5YU7f7Yh5
	zTaz/pNP8X/ppYn5afBhMhPIZhW6Jiq8lYRkPTa+ERUgGGqgDrwAlLPovOPlfs12EpOWjnVGMi/
	d5o5obeGZhWsR3Ohe+A==
X-Received: by 2002:a05:7022:6baa:b0:135:578a:cde2 with SMTP id a92af1059eb24-135578ad3admr5580663c88.34.1779217333582;
        Tue, 19 May 2026 12:02:13 -0700 (PDT)
X-Received: by 2002:a05:7022:6baa:b0:135:578a:cde2 with SMTP id a92af1059eb24-135578ad3admr5580606c88.34.1779217332985;
        Tue, 19 May 2026 12:02:12 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910baf22315sm1962832785a.21.2026.05.19.12.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:02:12 -0700 (PDT)
Message-ID: <3ed6a4bc42a547ed973cf2b77bde7171e0a15314.camel@redhat.com>
Subject: Re: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
From: lyude@redhat.com
To: Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, aliceryhl@google.com, 
	airlied@gmail.com, simona@ffwll.ch, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, apopple@nvidia.com, ecourtney@nvidia.com,
 ojeda@kernel.org, 	boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, 	a.hindborg@kernel.org,
 tmgross@umich.edu, driver-core@lists.linux.dev, 	nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Date: Tue, 19 May 2026 15:02:11 -0400
In-Reply-To: <20260519205947.3c9d99b3@fedora>
References: <20260506221027.858481-1-dakr@kernel.org>
		<DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org>	<agYbppHWXk_hW99M@um790>
		<DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org> <20260519205947.3c9d99b3@fedora>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rYtM3cXFPRaBwfRO2ahau1fLc8T3EQ1V4RDYJcsCPrI_1779217334
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-19 at 20:59 +0200, Boris Brezillon wrote:
> On Thu, 14 May 2026 21:07:11 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>=20
> > On Thu May 14, 2026 at 8:59 PM CEST, Deborah Brouwer wrote:
> > > let unreg_dev =3D
> > > drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;=C2=A0=20
> >=20
> > You shouldn't need this anymore as the drm::Registration itself has
> > private data
> > now that is bound to the lifetime of the underlying bus device,
> > which should be
> > the correct lifetime for juggling the GPU page tables.
>=20
> The problem we have is that, to initialize some of the sub-components
> of the driver, we need to be able to allocate GEM objects before the
> DRM
> device is exposed (registered), and because the data we want to
> attach
> to the final registration contains these sub-components, we need to
> defer the data assignment to the registration step (which was allowed
> by [1], but apparently this was dropped from the latest version of
> the series for some reason).
>=20
> [1]
> https://lore.kernel.org/dri-devel/20260320233645.950190-4-lyude@redha
> t.com/

I dropped it because when talking with Danilo I had the impression that
we weren't going to need this (and I thought we explicitly had
mentioned it when talking with eachother). But I'm always happy to add
it back


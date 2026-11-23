Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468495;
	b=VCWoRKLVjRfRrL1u96gZxETrvrhUDNWOnF+m50GS894b0DS9tAHkBXf//PBoCuPuri8S
	 uT/WDcucs33dsi8P+kdW7FrE6Q1E2SKTsX5qEsvLzmYnq45XmrvvbEisL5EDNsSAGSmbT
	 6Ukmx7mcRh8nzXqFguhaRUCBhc58XnuPLTNyMdWWdRrOSlEuTp9kW5411N3o1f5OsymCZ
	 lj9gLIMesUAxCmCRV7J/Kz3jgsW8GbeEFdnJ3hZ5cGDZR6AGYKKz49D0wx149ED/u23Lz
	 nB1S/AHFVZAlg7E/ecj8AQ0y5fYm04xCOgqTg2zXXDNHfaWTXTdkOWmCSv2zajfnxGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468495;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=uMUkPd17tmOQBq2oh/KOicPLQhomscvQuJiftTF2lFc=;
	b=350V3q67zIHXYgszaYJv9Is0Qqa7g2TsNVtI1MPNFCSvITvPMKyX5RHS7SRfJS1vSAXr
	 8jWjj8PNl62OMkWe1PnvVGVp0ith0ysDWs5cCPWWTUs8QXoCDFjnWG6YtvSGLSAh8besG
	 IyhWJz1o++WtyawnO40TclO19RGPFUHT1R2asPfrvG79pHpM3QYvsgSvTaRjnBXpNPd5Q
	 1sRSATGuiXR9pNUhPVUrYvu0XCqlntth8hGEZMSorsTpXYI7I58lc+YRJmUKbyi9pr0/h
	 SLR9gX8e6zt2oRX7v7mLb0CQTGT7AUcY6qa8Gv5rDUXYtR/bgSnu8Y4pYbutlAQAa6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Es3UkxZ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479C7606A31E
	for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Es3UkxZ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7251F000CA;
	Mon, 23 Nov 2026 21:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468494;
	bh=uMUkPd17tmOQBq2oh/KOicPLQhomscvQuJiftTF2lFc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Es3UkxZ/c5iLCjXzVJ/DrmMfMuRgCNrr/zsOCRDRPHOUs5nZJXeCxpcnJqTKK+ny7
	 N2G/kPyASzYdhV4KhuqBINhWf+//1ETeflW7nMfLA9M4Mc8AA3psgTDAcCmltHK/AZ
	 SQ/vXKdPMHhZzsPmKLBaWLe2wG0OeU+Hq0lptxMe7DPAhOzwLgCNzVUtRcY+19E4hF
	 XKCKFn6oVTmbe4vEXTIzxHVq1p5Snk7jmtwclc4llkhmQRkL1qsQglgH8azHZwwl76
	 zV/NhBcWYGyrn2etfZM0AOQ68wzGVAuM8niiltu/snaeTAetd6G8jL9PQRtWMDfGly
	 hRuY8MIy4sprg==
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
Date: Mon, 23 Nov 2026 22:14:51 +0100
Message-Id: <DN2WGM8KWOD4.1Q96FIYG22NA0@kernel.org>
Subject: Re: [PATCH v2 2/3] drm/nouveau: add option to leave GSP-capable
 GPUs to other drivers
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "lyude@redhat.com" <lyude@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>
To: "David Airlie" <airlied@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-2-5e8c27aa8555@redhat.com>
 <617a6fcc6a541f27351fb7f5abe21fb89553438a.camel@nvidia.com>
 <CAMwc25rDmsXw++KeE4OhTCGCq0PRUZJJQaEMXY2dbvdwWzyL7g@mail.gmail.com>
In-Reply-To: <CAMwc25rDmsXw++KeE4OhTCGCq0PRUZJJQaEMXY2dbvdwWzyL7g@mail.gmail.com>

On Mon Nov 23, 2026 at 10:11 PM CET, David Airlie wrote:
> At some point we need to give the option, but indeed we don't have to
> right now, if nova developers are fine with always providing the
> command line option then we could drop the bind options for now,
> but I know it can be annoying for devs.

I'd prefer to go with a Kconfig option right away.

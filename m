Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300843CF030;
	Thu, 30 Jul 2026 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785446904; cv=none; b=QNtpC5LzcDz/J7e8YVkbzWbJNChfZ3OfIBY9t88Bp42x4ObptKuWB+jwHzeLvOY8cGDM/f0wy6/GC7uiBW0NEfqSULOsjNPIpaPDB2TSDrOZU+69blJLgxRtpaoYjqR1O5FOYOkBfjHRIQ0iRTQVADfo8bEOAZbevBCDaj9ccyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785446904; c=relaxed/simple;
	bh=pdt0LZNpjycH9kodITIE0NRP7rSIY3nigkRdgdDLCoo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=k+U6rCqmzN0IFhOofxelEHA46fRHEYs+Agc2N3FIUEDahIQYd0WjtuNqa4MvXpQBIpt02/TpZ//HVLpR6oC2iE96poz9QFF2XA4UnY5tddZaeGCSmOLnq1JnM8Wpkvjwv3FJPc5AEhRE+5shJUlfW6ClDrxUSf5oeOTdiaptWLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6qGFEZ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6qGFEZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0744A1F000E9;
	Thu, 30 Jul 2026 21:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785446899;
	bh=MMBwaC59CxR38LUGVMMGUcBMlExypeFMUmqrX0IJpLk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=T6qGFEZ6SH/O6lmTdVjgxsOYAErsmMxJQIQhjxbxwowxtYDIjZXcZ7I0HKdBS8I93
	 cALQkBR8zbCpzmSY0EZqNQ1ezz9EHFUHBnWJjIS/3wub9s91nKnutE9YXWS3DSqxle
	 IOL1OiqL8Cr8y4McKR5z6edyAqYvz3mh5qe1/Zu45mykpqDHKaQlNoK30F8kuCc6ci
	 sOQV0qlT8ZxicpxkbTTf1xwNYlPJM+ee1JEXMNK+cme9NboqbVsbMbZosfudWYYMrA
	 KUqnEC5+PTPxXF+KrsAb/6L/DH7p7LpXiW1iOu34PGZY4hBwzsWyW/8dXKdln/MSEf
	 ZQ9YejGjtMXmg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 23:28:12 +0200
Message-Id: <DKC83N1YHAGM.3BRAAMYUVIL4Y@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/1] gpu: nova-core: populate GSP_VF_INFO when vGPU is
 enabled
Cc: <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260730181404.776028-1-zhiw@nvidia.com>
 <20260730181404.776028-2-zhiw@nvidia.com>
In-Reply-To: <20260730181404.776028-2-zhiw@nvidia.com>

On Thu Jul 30, 2026 at 8:14 PM CEST, Zhi Wang wrote:
> Register GpuacctPerfmonUtilSamples in MsgFunction so the receive path
> recognizes vGPU perfmon sampling events from GSP-RM.

Listing something additional in the commit message usually indicates a sepa=
rate
patch, but I think in this case it is fine as is.

> +/// Builds the VF topology passed to GSP-RM as part of the system inform=
ation.
> +fn build_vf_info(
> +    dev: &pci::Device<device::Bound>,
> +    vgpu_state: VgpuState,
> +) -> Result<bindings::GSP_VF_INFO> {

I'd make this an associated function of GspSetSystemInfo; it solely serves =
that
struct's construction, as your own comment already states. :)

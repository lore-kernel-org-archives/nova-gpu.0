Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22A394E91;
	Wed,  2 Sep 2026 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377454; cv=none; b=rucA1WTUQzkmjtxjMGwPV9jzmrEBetuYIllhSW99dC2j+Cc1Odkd+vP5zDjg7PecQuoCA3hqA+Z+5bRdIfj7QnNKimcbutrDHgE2ys25nLPU5HrOufZjwNENHWS54ljzDFPEGIvhCNCVS3JGUUU+pGZFZtG/7v/T9pTfFj/XaUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377454; c=relaxed/simple;
	bh=pNGlzmw8zAImIDBEXnKUJlbc5s2v2mcl15GfhX5nDI8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hBmaQ7Bcrcs4XXGIt8NbJmhzvDxJ9G/JU6Dv0C7WgMBLBYiRhlUCleXsnVj+aZGCX1G7xUbeghOHUuPDd+zUPwPPTl0ZII7CJ+DnijKystKH+4K/oJQ+sst2xCzw9h6Cd6kBsIZrBzMGZWodsHMSiomfkkaByRnH2A73xUYys/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FukJXx7d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FukJXx7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883721F000E9;
	Wed,  2 Sep 2026 19:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788377445;
	bh=pNGlzmw8zAImIDBEXnKUJlbc5s2v2mcl15GfhX5nDI8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=FukJXx7dyLKDrk34O5Ee6DNxm15IyEvxJaMw0ZN5j/VV6SG4RrzYsTne/N9kL5MiW
	 ko5EcIOw8wsApIyHIrsLlZJKRvre9XoTt6t7IwiYTqatgQ8+eXgGftJIxBY/PgqCG1
	 DpJdTspUPw9ibBrNhCr/mBgW8IaD4OZnf1OSBCaJKK1Hp+IOAWETBCIGZSbAeJ7GCz
	 NWxPD2kuDF5LWeA/I9aQJ5zpSVpf+BkhUCBKJBwClb+/L+Mubtsdc199Jcw6JDeSgd
	 AA/IHvPcfFJDd5grBxULdk6AcVbWh7wgPqJTBE6/tZwYXF5v4COUWlJArStfruF5wR
	 2xQsJduZqqcsA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 21:30:41 +0200
Message-Id: <DL52W6KOLJIQ.1JCEW8T6036A8@kernel.org>
Subject: Re: [PATCH v5 01/11] gpu: nova-core: Add public driver API to
 nova-core
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "M Henning"
 <mhenning@darkrefraction.com>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-2-apopple@nvidia.com>
 <DL3EGE1IY4FL.3X49WKCS67UT@kernel.org> <apfHOxl6uB8xQHBq@nvdebian.thelocal>
In-Reply-To: <apfHOxl6uB8xQHBq@nvdebian.thelocal>

On Wed Sep 2, 2026 at 8:57 AM CEST, Alistair Popple wrote:
> Not being a Rust variance ninja it took me a while to figure this out :) =
But now
> that I have I agree the projections for 'static at least are quite nice a=
nd I
> think Gary's suggestion helps a bit as well for non-static. So assuming y=
ou're
> ok with me adding this code with your Co-developed-by or other appropriat=
e tag
> then I will incorporate this idea into v6 so everything keeps working if/=
when
> Covariance no longer holds for Gpu.

Sure, I'd suggest to base it off of this diff [1].

Thanks,
Danilo

[1] https://lore.kernel.org/nova-gpu/DL3WPTVM033J.33RWYCZOC67Z1@kernel.org/

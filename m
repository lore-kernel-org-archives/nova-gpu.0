Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF846AA8C;
	Fri, 14 Aug 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709585; cv=none; b=YGpXSelCrwo6tFypAy2dllFrkVa3isL8AXbK07MUVKBCc8InNJ9Gao35Zsu13xgbv31IdJ86MwsueIjVKnZpBlmksvnEDcsmZgKVoYD/OvbjdDPisCoHjhrUPVqkVzSyk1NvXFkE39ys2522CmftZtKkoUKwiCpPiPx9rG1HDkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709585; c=relaxed/simple;
	bh=VNGf1GxU/39BcV5JcX20ikskArvEkrLx+QfN40xGwfE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IUARrLtr0qJqCvOVszT2Oy7wxJGctKXTFDBIWKdqxO5ZcmF8MUDbNTexOb+GuMX6xGV75eizhzkYYGWOiwv1tjYREQBBNwibK2xtZbtz4lqGOHeC07Y5/UVT4d4ChnaLSQHQwXKCpDJREslSawfHEDYCpy4vdFqx3sUiU9TstKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtS0wx88; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtS0wx88"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800591F000E9;
	Fri, 14 Aug 2026 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786709584;
	bh=VNGf1GxU/39BcV5JcX20ikskArvEkrLx+QfN40xGwfE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=KtS0wx88QzFpegSVNQnMdNGu+XrE97JBMGYsUVp0JPvXqF0ydU09mYBWpADgkQP8w
	 uBYI1XK17Kd6sxDKWO4m2hurJg8AAzYC4+hFacib8PVwUYo0ADNJbsmo+kS828z7sN
	 FmIeYhaoKvesaSOLXz2nNbL/XFixOHdoy9fn26+8zwDQSL78Qpl0K+UJyX3oFK7MLh
	 S9Qn1NgO7lDTtZvZLJZdcdmC2thAs9XVM0QGkleYq2WB41vs3fZgqLueGTVXuWSyH5
	 Bwit2lF5F8ilwFIywMfnj1rrvTaYEM4SNi8zdUa+o81FK4iGthFhtwxjqY0ch1KH+O
	 du1MDqUM9wS/w==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 14:12:57 +0200
Message-Id: <DKONOORZMS6U.3T4EB1Y2JYBU5@kernel.org>
Subject: Re: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during
 probe
Cc: "Joel Fernandes" <joel@joelfernandes.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-5-jhubbard@nvidia.com>
In-Reply-To: <20260808031120.363869-5-jhubbard@nvidia.com>

On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Allocate a single PCI MSI interrupt vector in the probe path.
>
> Try MSI/MSI-X first. If that fails (possible in broken VFIO setups),
> fall back to INTx with a dev_warn so the issue is visible in dmesg.
> The allocation is devres-managed and automatically freed on unbind.
>
> Reviewed-by: Will Pierce <wpierce@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

I think this patch can just be dropped, the corresponding code is removed i=
n
patch 8 and AFAICS doesn't really serve a purpose in between.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8621FF29;
	Fri,  2 Oct 2026 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943664; cv=none; b=kDabLRBIlDNebIjJbnjjP3yLfrlu+j7mxRCT/y3vRhHBjJw/vr4mA5MIneF0L3Sieq3WJ492usQi4CyR4o9840/Cr4KRjrAyMxhFdNTF84C/m5feiaO5lD3q8RP2GfMgq4QrgIj5D3L0WtJAHLkPjSBn8wnTOdnS7gJdQVV5bVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943664; c=relaxed/simple;
	bh=RRwF+RWzV5dbJ42KBC/E1yIKgGPdDzKA7X5ZDTwZFyk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=At0erArOseXYQpMlRKElb69dmiHH4vv8lEwhOGd2AK71zCecfs1q7NOAbA4xmY/RHtn58pTpXl1P2PMoYzG+6WhydapVg3GajqNRXWTxtfyCM2Qq53YTzJo63/o6e1ut6puXBnX3SLOTtmQciyGg/Qyx79GON9ywmb7LTHsXW+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sx4zunCZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sx4zunCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CBA1F000FF;
	Fri,  2 Oct 2026 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790943662;
	bh=RRwF+RWzV5dbJ42KBC/E1yIKgGPdDzKA7X5ZDTwZFyk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Sx4zunCZXnl/n9jJkLudFl8snLE8uZItOt9vsGG6odZrMf/NqzElurMWpf4ifNsvu
	 QLRSdGfAQUNDjqXGutFpqSOxPzX/PxD2n3kAER88nb8zqxsa1RxBWoKNXF3kIHJ0+w
	 1u5QyJ255Acq32H/A8vtehC64nITwJ7WnBcLPIXqcyxo2UzMlg2n/HET8dWRgTF1yG
	 cmGalWa2UGDycpWSmY/pGGEvJ/mkpREjMaWM13cMDjaGjmO8C3sP59q0meYem8mnpE
	 W6GhJNKkli+4WXkL8O7uzISlmlO76t6ubj5JgcUIq3bmmRnENSFFhWoKtEh4TEZ86L
	 KcnQMKhnGKsAQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 14:20:56 +0200
Message-Id: <DLUCJHNWXC7P.3DLNSXLG3FB0K@kernel.org>
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
Cc: "Gary Guo" <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
 <DLU9C3WDP0T6.155CTDSBPI93M@garyguo.net>
 <DLUAPXVM7NYD.2DOV5B2ALJ6XN@nvidia.com>
In-Reply-To: <DLUAPXVM7NYD.2DOV5B2ALJ6XN@nvidia.com>

On Fri Oct 2, 2026 at 12:55 PM CEST, Alexandre Courbot wrote:
> I will drop this patch and replace the code using this new method (which
> is just an optional probe-time self-test) by a polling loop on an
> atomic. That way we can wait for the helper method to be available and
> revisit this with the proper type.

Sounds good, let's do this.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665141F7FD;
	Mon, 31 Aug 2026 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187311; cv=none; b=fOJ3BoiPNbMe+ASGW5Gji9KnKf6i/7CWTZzhPGRNGkFA2wMhpR/edKd9QMmFS4PWtLFlUDuo3OEe811N8kv4cheP+RBrWXUlAViyEX5Nxz0TtKPy2rlV7rd5N2ww7/Vt59ojkkN/s0LO+HOtXeze3kzMZFSMIeAvRFMNbmjwP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187311; c=relaxed/simple;
	bh=FgIb2siZsPSomjaTwvmt8zr4SEcbvg2+qR6QFbqzAE8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=oA9wL92uK1IdhieZJOmDYZ/fqoSdG3jNlih2hqTDkP19HB5J8X9yGeBrebyaLjhIrCJfoii4OPSPzC+PJu8+xtlwFlRyyxRbKCQ0HGaAZQ9fOFZEh1BfyYWfvbZnASXqAAw2iSkolQXJpA9SI0tXb/HsRW6V5dLqCIFijk5pVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCqugcng; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCqugcng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5275D1F000E9;
	Mon, 31 Aug 2026 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788187309;
	bh=FgIb2siZsPSomjaTwvmt8zr4SEcbvg2+qR6QFbqzAE8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=VCqugcng/IwD9wYujSc6GO4vIJ3UGy0Y9DDgx7oxQdjePynImVtwT6FJCTFQ3krfh
	 RFfpTv/Z1XwehqEbKHRmbn0HZLB7jGhg3V+pepsNJW+o8Xc8+g5gNqoR6wc9Zz4Fdi
	 Sd0f6IlrIzhNCqGsjStifcZLS2BN580CU8zkePtyyIlC3v0VNKy8y9mFM8Tw+LtnY2
	 skc1Th5iYoQoCI8t/TEvi7wLTvD61hkcp1BcUd6gLYjRhSqDRjO5RJpdA3scKUFUyc
	 E0m+pPTwwaMeeJR2fZ+cB4bnuJDs+tOqyHqH2jpxsJULm6jzoQxaKYLNr/mIWVyMM+
	 adZmQLkOggPoA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 16:41:45 +0200
Message-Id: <DL37HVMJQP2U.126BSJ2S51HI0@kernel.org>
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "M Henning"
 <mhenning@darkrefraction.com>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 10/11] drm: nova: Report GPU short name in GPU info
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-11-apopple@nvidia.com>
In-Reply-To: <20260828033531.1117754-11-apopple@nvidia.com>

On Fri Aug 28, 2026 at 5:35 AM CEST, Alistair Popple wrote:
> Add the short GPU name to the GPU info structure.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Same as patch 9.

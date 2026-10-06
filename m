Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4143E38836A;
	Tue,  6 Oct 2026 22:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791325221; cv=none; b=jBVgx723LPlfutH1n00Zj21fRxqPyeVba+UYlw2AFa0fxPbJ0dPWr6iHfD5MrkItZeoiSVu9Mw6hLqYAQCok9gFymRyV17IGD1NqP3gc2be3929aY1rcEv/+1wxsO66b8guk0cy5io+qVUBmIszi7huvfxu7xpnXw/26V1AfliY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791325221; c=relaxed/simple;
	bh=PO8FlmAppGType6lBoyHdjXUzhfsHpl7vSjXpJjFldQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=DPd32fs9lDt0KRNxke9FKt9NQF6N0fQd/72djyBZzhUF5wWLIP539I5AB5BKuOg1qi+Ml5yjeArMj0BVYcAFcrzt6KqBDSx2/4ys1y4ju/Lv4RoeCKUc6yW9KfEv8uVTgujo260n4RUAz6MkYaFki1FepK0a6VySDSbOur3SIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsA1JsL2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsA1JsL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635BD1F0089B;
	Tue,  6 Oct 2026 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791325219;
	bh=6XEv2S3lnEbAy/rtFG4gRenDM0hZDhO4PFP4tPnmJgg=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=JsA1JsL2LMhAHfQBfq2zOYKpu3aBiDPbM9+qCx47t5J4ZoutScrZRdpf5snaqchnh
	 oeDdyLcKtNqlOdTlHqo995YUWeUvIEXkib2VAv7uZmvRQ6veh1MdP4JEPRpsWRMW1D
	 +3++f/TXJm3mbvJVZIMQGyb0fbmn0e2xBop9WlmLVzVYshJ42qyjQ8x7oozD/M4a6n
	 tsdi2zNjfUz7bwm9xdqSD+nrJp/43Zmyq2Dzwd8IqH9pzlpoxltrAnfBtMgYeg0FHT
	 9gJjdnxVnWx7PU5HH6HgOp3zIRH6bnzWbo0ad2H9UCQaZItBRwYgNn6UFKJbzH8gEF
	 2/4vV69bHSXSA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 00:20:15 +0200
Message-Id: <DLY3SJLA1YG0.1YBCCD2CAH2IC@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: firmware: fwsec: use zeroed() to
 zero-pad buffers
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Timur Tabi"
 <ttabi@nvidia.com>, "Robin Murphy" <robin.murphy@arm.com>, "Tim Kovalenko"
 <tim.kovalenko@proton.me>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Thorsten Blum" <blum@kernel.org>
References: <20261006100442.80432-3-blum@kernel.org>
In-Reply-To: <20261006100442.80432-3-blum@kernel.org>

On Tue Oct 6, 2026 at 12:04 PM CEST, Thorsten Blum wrote:
> -            let mut ucode =3D KVec::with_capacity(aligned_code_size, GFP=
_KERNEL)?;
> -            ucode.extend_from_slice(code, GFP_KERNEL)?;
> -            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
> -
> +            let mut ucode =3D KVec::zeroed(aligned_code_size, GFP_KERNEL=
)?;
> +            ucode[..code.len()].copy_from_slice(code);

I kinda dislike that this is now a potential panic, but it does better expr=
ess
the intent.

Can you please add a corresponding // PANIC comment?

Thanks,
Danilo

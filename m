Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE73C8700
	for <nova-gpu@lists.linux.dev>; Sat, 11 Jul 2026 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783776341; cv=pass; b=XMrpPNCH4v+Om8huI3ab0dfhhTGYtfq7lRLcDehBLQ+50EY+TDenQwWS/mtFL1NkiU33d3DQO57AIRsKryCFynOLX5d1781z+b6LAXZe/SglNv3QTEyrXrFRbq/rBp6UUggGMPXHnmHUw4z1pzBsubm+9wuWKWsWXnC5TCE1nUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783776341; c=relaxed/simple;
	bh=pEkxSRr2EbnFXPQ2EdilqMHjAbry4RBOsxKbRLH+d5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ix1VBN0cUg4J9Dyur8wqTfTqsKNKinDdv+6KC/u4A8EeO1yj7OHoMY4b2Ex8IAfKxVSJbXy8wrEszGS4joQVaTIwO4dslhDRKWnsmwLRnkwmSBku81v2hOO907XHI2ef7vWaQMlv61m4R6AeB8GUeeEXaUAMaJHvE+qBq0qV0zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkndY5IZ; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkndY5IZ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso143682a91.2
        for <nova-gpu@lists.linux.dev>; Sat, 11 Jul 2026 06:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783776337; cv=none;
        d=google.com; s=arc-20260327;
        b=XZDE/b0b7xI1lYIdKpdiUukDJlL6RRkQsOrDOLn9F9UXgDrmTgfJ5fTX5hn03MtHhm
         nLBS20lIC7x5b9bYUUWfyg8oGnGww1s+Q1+lJ6qDLSzSlP7ruu7uggEhDUyJnEIVlaLc
         sEwdi+uvpdDSt50Do6g2JwYn5UDKy8GK0EgmdRCZyiYOazPTY7x9x0yt6ZYuTOfTNRR2
         5MMDjccwG4xpyaQRyC/TpzDDwe2FhXy2/g8e8JwQVt0e8hVBREBn1kylHaSis4LKOxKH
         MAOEi7NZJe1v+DGvSnIXVTDrbznhg5bpD2G6eMO8omQkCqauB3TMzAPLpH9jcb6H8ZJN
         6ZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        fh=TFYI8LEIX6Z67cmJp8CdD54HEd5fExjBSX4zxJJjyoY=;
        b=FxIeSODUlxTUaeKCZIDURA7zptkaPWriyVXRQjVvHP+9UcZkEBS9AbQArtRf7ROzaJ
         0c9dKKMvgPuZV2GPXqgYn0AhjVgOn7yVtZadYe2YdBwJGqpmhMBNA6Wi3HoU7rv0SjNc
         hSsJJpUBWcL0A9Eeg9/UDyWkq+UECl51BZKguLfz0JazPLXQhw1AZk+j9FQtCn4TGRfP
         3qdxTBnG/Q6JH4sdE4mkkXQ+56NY5ZxrzjcwhqFTAB9T9bLQ/NAnPGK6HWIYZqq/Mwuv
         qI2uB3ODiiB+h+uNHFCqPZkkmc3qlrlV6oTFbQ/1HrkhdQscHk6RvQZeOxz7W2Z99xJk
         Da3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783776337; x=1784381137; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        b=gkndY5IZDHC+dwtgqKD9ddEnfLx25HGWR9ArowyK2GxOnjkjqbAWVn7OFIIyQj4nvo
         MOGjX5mli6Evehco5bzOS9XR0BIdODbDPbA93u6SkQll4ERihG92gzGJ/kIpzBNHK3om
         ydU6Ukb2DimVKRLS9wXXNLeHZeKbOdu2xNVOtAeUv8xsLlg/gFUiCXWM5Sw8PXco+XZJ
         d1PWyFdCOax0NT6LX9RB/Pge1yRRuNeAblfyNxA/a9+GiO5JV9FxwAZ9DjuyhTsgnscp
         uG+FlMca8j1Eix8DCFnftSlXFBVK1UTeS9+6z7d/MZjhUNWO/GoyRtHpx408Ui6rfiPy
         hFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776337; x=1784381137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        b=pozLH7vhn1J4/7O0iZOC3xV1hT3Z7RgFVNizDk0OZ9pQ0CsDz0lXQH94lNnX+cL4YN
         ADaTJqmOT82dUqPggMgE7qdx05VjeLhrqFOCG+tOy/uR6iYyMNX3EroB1+5sfr4/zrCv
         oCM88VpWtwj24D4xmrcDAmS0Lemcq5/4SeAEzyZf187A+WdDfy7bP4UdB8qiY154Tzg/
         aYD7XEs+zgb2rWWsrjZE90S4vGPSFa8LKIUvi5kuTy2CSwU60tKoYSM00Q0oTUZ/ztZC
         7NJCiwNKtCDzaFPDWCwmD3ADZ7nj6wqmuq8+KEwrMU/PIXL2DTKK34q+XVNMstWsErDM
         948A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8teVc6fYzKbkI08oDrSdc+C/2CtHZeIUCy9nQz6xJyCBBSCzldQ3P5iiBCwv/4wvfjIlYoLFOUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhkNVbVIBxJp6n747YR1GAmWW/QNd9y/qtZNMSxS9SHI2wKhE6
	0GzA/naGhRwuE7B4r3w088Z4o4SCzYWqqP9puSk5uf//SyHCH5pO5sZc8sb5emXwpS28XqIUhUs
	WJ+zTR343gtQm8sTk79XKn9p+lyCygbUqIKempuk=
X-Gm-Gg: AfdE7ckcgFNyoKi1yko4Iy9nqQ7to5ngkUq2P1FE68qXXaSVs3KanbgEBSn/ne6MoTJ
	ZYcQoCVAUenQcWgJK2w86TBN4H411gDqMPcWMdAkKwP3GwncqYUPbLz9SjGHy3mwfpLhG8KBbRW
	4x/Hqp9CJmCVvLcICExIYkhhzvJZ9oJ3jBJCRmg1aZnJ3s74xnVkHdELEXig917jOM9b/F4OxBn
	U6isi2q8CcHwJoBwlZbytq39NLY5+5WIvbeJ6G3LP9nIZaLbFvktDesCI19KoVOlVRhItSvHGPp
	goZJVhSc5wAJORlkX4OhV87Mgoefvv4ObvupeMaLAGwqyVIks3rvghHlhzNaFnP2sGQK7yEJMwi
	hf9r0HOL0skUy
X-Received: by 2002:a17:90b:3e48:b0:380:7688:fc06 with SMTP id
 98e67ed59e1d1-38dc7849860mr2213763a91.8.1783776337508; Sat, 11 Jul 2026
 06:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710230428.865447-1-ttabi@nvidia.com> <20260710230428.865447-2-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-2-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 15:25:25 +0200
X-Gm-Features: AUfX_mzK6nA89X8Ey2KmSvtSrtpGimxdsinkTI-BJ3XZkqZKpbmpJcngPawWU44
Message-ID: <CANiq72nENzJejiO3pmV9FhRA+H+zvCtfzWY0=wbTERToceiu3g@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] rust: alloc: add Vec::zeroed method
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	Gary Guo <gary@garyguo.net>, nova-gpu@lists.linux.dev, 
	Alexandre Courbot <acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 1:05=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> +    /// Creates a new [`Vec`] with `n` zero-initialized elements.
> +    ///
> +    /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag.

This may be obvious since we pass `flags` and the function only does
this, but the sentence (here and in the commit message) sounds a bit
like only that flag is used.

Cheers,
Miguel

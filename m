Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49556379C5D
	for <nova-gpu@lists.linux.dev>; Sat, 10 Oct 2026 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644644; cv=pass; b=dFN3rzT1b7WeCCgIA/3MmHdt+m5hppb9nD1xzkqfxoc6RwuMQNlJUnpQe7adB3OPjGnK/IpzwdfFb/OXfvHemwtJhr6KDwvIRstWyKQ2P8ETDen8fcjWLbVpqRiamde7cBVmPaTIrjLFk7ELkiy46bF3qz7uJAGam+WhqYE5Dxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644644; c=relaxed/simple;
	bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcZ//bupGRLnAjrjejXr60VNwYT1VRJOqeEd794RkrIDmlMI7yRXo6xKuY5zbb8o6PdNZq4KS9dnY7gLxhuh99jiOGTfLiBpFOYoLdi0di99DDUfsnF4uUcbhoK+HqywBzJkGxTLlbUHAfOQ19NO2pmhJMf4aZN/WMsB5qMJmW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gH/L/xM/; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gH/L/xM/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so6200115e9.2
        for <nova-gpu@lists.linux.dev>; Sat, 10 Oct 2026 08:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791644639; cv=none;
        d=google.com; s=arc-20260327;
        b=rYcd9XHtcvppdBf7lxyAk56QNTmqmhP1m3eLAelOcVesk6JY1rZlRwLA5BurgkefSY
         RQWVgMld59vhcdZ0qJJKHzef2HEqXoSvQuucM7waN6R8mQzveyTQx/TDQTctg2NyzKem
         a8JLxIpVj5j9bfT1NF8Kv8Fcm9c3I+hIdYQLBG6GEb49G9n3sROqHuwxhGWpEHPXt1a1
         KwMpel5kuDZkNSKp1H37ltPs1isUQzgVfAx9Iov65SuL95v/BMK2J8SCdhkiERoQUyR8
         tFGYzCfBLEInzFEc+bepvHHAFxbcX5gldpZFhOl+w1kBIO/9pJMwxCYFLYZSQva1jxlu
         7k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        fh=/d1Cyu6aNVk+QqxfYx1NMWO2HokKvUt7o8lApDicKTg=;
        b=fh5id/z4bSYoi+WEAIVHrwuHlHZegyiHoBPtsWSPXHXnBke1H1aKUjPU+n2p6YAqk1
         hAvWDFrLKAHcY/MBkl4gnEAvSq6ko7WVlnLysI/UBd0Hi48FWyZTozLyrni2OmY2WbmW
         daS4+qbqwMbkhVhDETsst4nk/XygVsrgYUE94EH/qdum2T7l6gRyZhTZsJrR4aHyUh0z
         fJQhJvnW6YqxfZzv7Nb01cj48952HVTnHfy9sJb6AZfnPa2C4XDzF5mUhFplBv/Ff3FC
         DQ3Vmpw+963POE+RVBOev3pmbwMcZkCahRGY1WFJ3UCGGpGuFR/1VEyxdExDIZyhw43z
         OP7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791644639; x=1792249439; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        b=gH/L/xM/iP+0OCXjtCcX+xY/Q5x52+bz0Z5ioJUYegQjGJheX8e0TwAOz6F/e8n+I7
         QwbNqt7P9nxzO/3mzdTWsotPmpYVQG0HyvAoKvrFm9okTOtdsVjVFpNPf07vYKVfIJM0
         dGe0gZL2bGfDwF9zsHv4HsFcdLdNlOBFUBNxfYgbj0X7Wxr8nDL5p0uQ401XzyPt0Z4Q
         7FK5pTFG66DnvrUFc2hybFfmKk16hoTNy0y8NK5+RbQvJer45TCPMGdgbUolfMtRirpd
         obdMCZJHFnpR1NS8p4HLSz6jXsJbdPYSf4vV3zCQxpTMAb+7vwQVZgF7mPhCCyhdTa1s
         KgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791644639; x=1792249439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        b=EPpAm+E78yrqBdBN+O6wSkliG13iMABwKSAh4/yFyeFBuHgrtWNef1SYhMFqNyS+tM
         E3DlI6LvxXwDpOx8Guq3uoOsq1j/a5PIWXfsC1TPFj7uipugvUwfWab4qmN2AvAY/96m
         oDL+QKOHsWc2DAvt+9LKZW10E/pnb5IhnvU3o0JQ0ur5VDM4gh1Qe161ZS+BABMSgHqi
         nKL4JoPn//oDFCYOaJkjdo+vBR6OFrxxz8DZwrKKygWiPD5VIptLJppz41BJJzRsZeD3
         w9K7WzCHUnQJbA8i5UVwd11HRd5tKOVRKyWd8KbazfbvfaCGMZoKBYacwK7fKGEtylBM
         98nQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9RfTVaVoghT1Z16Kv47tFIW5eiXPzghC8jczIs1Evtl5O4zE52GedCFYLXKlqi+HrJ2C6airUNg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIpVAokjX5nr7icN6pHY1Az+Gn+HmmnChwczQcwYLjiNGearzau
	7/b83yjsqwpU2ppHkew28RmgixciHYvca8DwvF3tejC6fQqHfrs1XK6ce0kCIjynbrPSSc5i45b
	958X1E+S4I21/AkZAAvDORR0DHucLnCOvb/bOFpm5
X-Gm-Gg: AYBFou3ZtPtzmmtJIzFM/288fo0UGev04vZYl4GqTRjt7Qoykdu8XIAAFD5YVxXaaow
	IChWoiu8KaddfzVCLZI08d2yjgCGnXK8Gdo7s8fQ8hxgOSvbel9x5ihoBqbl/atLsBF2Ok3p77L
	pnsKROL2BF0NWwfTevLfgWAiBWMjaL/Fj6yx8pCIBdAjOTO2TAkm5JjUX0UsUA4qDQAGDqj0J5N
	sVtNdfjjlAnqODHyApIljx8fe+uRzdxFCxqsHVGW/ZOt4F7pmcWMjcT/QbiKfe+sWDjTOFqmhUF
	uLMMqHY1r4ulwATy3v9LwdG097deua5raHzuDwVYo5N+BG7FOFG3IUw7YLfLrCXthNmU7o5/dMw
	8JxdANfC6i5q9Y/duKTIE
X-Received: by 2002:a05:600c:34cf:b0:4a0:159b:d2a9 with SMTP id
 5b1f17b1804b1-4a18e4d68aamr77276885e9.24.1791644638230; Sat, 10 Oct 2026
 08:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929190024.2248099-1-dakr@kernel.org>
In-Reply-To: <20260929190024.2248099-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 10 Oct 2026 17:03:45 +0200
X-Gm-Features: AclHuK8ZQUI3eItwXg_rZSYr1EbwRsPHujK2QRZB7QR-TB8HYr0HF9f_x1pIk1Y
Message-ID: <CAH5fLgh6siikdQ-vM2eMdbgqxOvquGuv=0UKZwidabj4tcGV7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: drm: Return impl PinInit from drm::Registration::new()
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Convert drm::Registration to return an impl PinInit<Self, Error> rather
> than creating a separate allocation. This removes an otherwise
> unnecessary allocation.
>
> Update both in-tree callers (nova, tyr) to construct their bus device
> private data using try_pin_init!().
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

For both:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

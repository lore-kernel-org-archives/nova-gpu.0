Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CA3E451B
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929290; cv=pass; b=Oh2vlCpGjkav5/1nopljwV5Km+TE/nNxwo3vP3+D4BpgAuJTPYPg8nD1lU7tFz/wUQAwCmtlXvCEhnk40cXggSebf6iJ2reeXBSIapmZrDn3YPZ2tru1GXxsX3IdszhxLA0OQ5NtIxU7Dsx9OVjJKRdUfugkiVdyhr311aRJzUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929290; c=relaxed/simple;
	bh=diH2idfj6C5xEcUw7EHKyOanYSmbt56Z/ovgECGMrg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erASVa1Ikd5/lKH4GP+6ubbzodFfIzX7c+MvYO7z0khsjdzyoCkXz3YffbGBgldRclFzc/5o8SVqqEUz4A3jt+jGBwJeQ93WcPTk28FbSRMB+fig+3d4KxB5V6/KhdHV9IRwFiMbSntiSK2QID8OonDTbhvWF9qOFGkF+FzjWSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=brS6tLwK; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="brS6tLwK"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso3910051f8f.2
        for <nova-gpu@lists.linux.dev>; Fri, 02 Oct 2026 01:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929287; cv=none;
        d=google.com; s=arc-20260327;
        b=SNJJymVYMf39/ApJ4dTLLeq/eJ2A4PqfKDT/ZF3vUX3XV5SBnbB/l0/75S8E6R34Y8
         Cxba0+JgXFqyxXnVd6hrW3tVvCJ5ynpV9NTp3ovhg+7GFaUqQCrP0VkSZHakvh5Pyywm
         mPnjYLfVbARxj2yMAd5scNJQQnrjsdAZgMW3GvmbrvN/1ELz1dKb2avgem5xE8kebvqS
         /2adTuAAS2wSPzWK+a2Xc3J9HB3RsnrZSackgpAc3TDJRJu++D72pDmsrRrFlHoOg8Y8
         vFd4XbBnZSSlHmCzDsXmQYErExFR/scuF3EgnXAAFe2MXPKwgHf0mRD+i8S4wnZgi8wh
         HQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=diH2idfj6C5xEcUw7EHKyOanYSmbt56Z/ovgECGMrg8=;
        fh=qwZBBVThxf07HrEhhz9oKhfRsvq/+jNj1mgIcSKPU3c=;
        b=U1UcNympvxsyCkr5+ZrqqKVXqtcumBF57+3W+x0lieM6Qa31zSjTCWZ+BweowEPh4Y
         LO90krxTFLJQCp7W4SaZTiDhfbZZOeGjx2ongYb3erDYwdjvz6yZoGVbY+5zoM+Il6MV
         zBG38PdebGdltY2C+zmDqUJt0MjmCfwNFSk0jnAw3I9qmpop1F1etP8eDMDmYd7YpdL0
         eXfxfY9suC/Wu4uhJhW5iQyjJVrmvG2HcKdFvVB8OB7KusbI3ijnqccqEgsjbHgLm2o1
         wJxTTDIMOierhGEGgkCOllE6/PfghRlUILPWJ4GwkJ40h0Hx0U1z5svnELHIc3dBQWny
         DKYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790929287; x=1791534087; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=diH2idfj6C5xEcUw7EHKyOanYSmbt56Z/ovgECGMrg8=;
        b=brS6tLwKrdWSHN+v4W9KBqgnCIGQkHf8WMWUNTPDihhN70YqmQ4ZFZZgyWALheNmAm
         1pYB2tHleaEY9Lzi5xACqefxQIaA2qGr37Tybiz0x2jrazsfBRZmwE1tLitsvt4GMRb+
         7sviUONrUxzOGy8jC7J5FxlaByZR8pjAXxcCbI9hjwP2GHZHHAuEuni+uA35s1/TlFqx
         Z85jOFs+WkWe5OBKM9is/VTyXC3KGJiQSWFSgdDjVH5z8qA/fwmWHTbin8Iw7+YPLeKK
         Z8x7kWQye6r82Y4X9VsPpQdJ0KicARn9A6tdaHiAMDSn06k7xM64sQQABfssbVRqlZPi
         V5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929287; x=1791534087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diH2idfj6C5xEcUw7EHKyOanYSmbt56Z/ovgECGMrg8=;
        b=lGmQDycWtYbEJCd4EXiqmOFJESA30DXjVsuWICX/xTKdDQRppIR5BngfoP8zQMnnH8
         Cf8edRC4f+OhSgcMe0qzAYfuMNXPVtKUzKP/SRBr+eFKcLDK82z0eICcjw+wXF+GqErb
         OMOC6j9yZMJ7Zv9ZLqpU0ZcxZohDQkGwUy6j2HWxG+/SalV/gJktansArINcFe19eV2e
         EZuw1KNya6nLiOnGTZRlXtouSnfN8YWo74h0hiF5GFhi5puss0tAqDQv0N/5j7d9eJE8
         lE8DDNUb2tTAyFgwxsCXMaCaLvIB8oNfo9nlVl6uKDUiheYN1ZCahdvc2w/O2Gi875lg
         OIWA==
X-Forwarded-Encrypted: i=1; AKwUvBwCoPxiBvJnne9WqLo9jd2k4HGI+kxZWtSDd4ArRXiGPJB1jov22J3/28ck91e6Qu5SvSE48eNQXA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJrtGSUwWVPQoxfmar5n8s0ht/Wzlf+JL4MXZeIbYItyJSbglXb
	llsyJnfRKEy0/wtoc4Zy9VhCkLjuju735ChLHWS3Ga85G2o5enUaUa9oxDGDa5uGfFCAxivN+mH
	ANr47543d/NqL/q1NY/VeHnNCGA0wylAtEpwcy43M
X-Gm-Gg: AYBFou2nSFXa4Oh2/b1fZtyewxb7sIT27XFMyeSh1x9Bc5mcGGrBI3D8WovOdBi9raV
	rYju65VdqHq/dgdqosJPwphEQ1Rau9IVtERmQeKlBk6RCyp/S5hjJIYMaOilPupXmcRGCGN345S
	e47O3Ax/NlZAW+LWMfUuJ7tvl3XuJbwaDlejSHcssG8xogeqGlsho+IKE7VMGsHWIv+d4XeTqHd
	SGEGxOYlmblUuMyP1ABSbrSDPf3RLDQp1Nn09Sr8joigHb/fQxnw/G+1mI2dg1feGqWhrkdxdgc
	zjD8X8tFJmd5ucROl3Ng57eI8bjFjDMqfQgWLRrCKRz4jIqBqOLclAOXHOGV1DvNvUfaleuntgI
	8GdY5qIf5MDVmIHLkHsaQ2Nx64zs50lbrHcTU313znEuczafTHkYdlDky9bWJxobx
X-Received: by 2002:a05:6000:4208:b0:48b:efb:4a66 with SMTP id
 ffacd0b85a97d-48b126f1580mr3353090f8f.6.1790929286234; Fri, 02 Oct 2026
 01:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930034148.590687-1-jhubbard@nvidia.com> <20260930034148.590687-3-jhubbard@nvidia.com>
In-Reply-To: <20260930034148.590687-3-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 Oct 2026 10:21:14 +0200
X-Gm-Features: AclHuK_MiHOR3Pc29XEsDqdfYPSNeVPeNz_wnZqSqYI3XkcpdkMabRyn2b6yt4E
Message-ID: <CAH5fLgiQ=aiF-WWvpPZkB-LcXxfeXAD1Q8zOF3cLQkU072XDKQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add wait_for_completion_timeout()
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:43=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> A driver that runs an interrupt self-test during probe waits for the
> handler to fire. wait_for_completion() has no timeout, so a broken
> interrupt path stalls probe indefinitely. Add a timeout variant of
> wait_for_completion().
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [jhubbard: return the remaining jiffies]
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

With the timeout clamped to LONG_MAX as sashiko says:

Acked-by: Alice Ryhl <aliceryhl@google.com>

Feel free to take through drm-rust-next.

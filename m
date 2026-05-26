Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62557274670
	for <nova-gpu@lists.linux.dev>; Tue, 26 May 2026 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819722; cv=pass; b=PmIH54pY7aD8kg1c1rrGT0hQ+x2a7UTeFYlMBoDhEnWaidwKdluXDKrN975XqKLeDZIMzvelg92Q53B+4N3Gu6U/RQ0rsKq5yQhjpQ+/f6xj2BXWngdfyavMOInqZEKd8G8tUDr8kGQUpUb3EsbW31tXsfw8NOHr0R1iUtEVFqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819722; c=relaxed/simple;
	bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLzwn6OVVam6eFvuJi0WHzZqOSsHY+DDMxU8a7DaxgEUx/7i9jTIfQ4iLQtSYMHrrLfOW4y9A0LXHYH+zG3fzSW0/D+IitekDYkD+SUXCceErwWxHSxnQwz/A6vDDT2vSAfkg77ZedJH5bgLdPwpu8r339PEXTbDFLFd98B8+Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWerNJLQ; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWerNJLQ"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f114d129c0so899849eec.0
        for <nova-gpu@lists.linux.dev>; Tue, 26 May 2026 11:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779819719; cv=none;
        d=google.com; s=arc-20240605;
        b=RsbsJc0u24aeEu74GewxLgZ9EGqTCKXs+DFFaK1XgnJ3TB1PuaM8kcibMsuEQX7vX/
         uVmCIy4uOvFkg2UZZY7SGInppQUY7YC39u167jJk7XkBADQ/YPUlkC6Kdum89Jd2OWAK
         K0zJhW+lKHHCxiddzjWOO7hH1rqvrFZVPuNNm5wo4yPJF8UJMsguoUcsR6Lmg4I//8tF
         o5Cfg57cS3nfxKICVMgIE2PjfzlZSxWP8ERE73i3RKkFQmudiAJkzIIEP7RCmEfyPeLT
         SlHF+nZMobD5UOv0ho9HdN/fQVB5r+skjrr2oGjzRL21Ana6AxCbIIS0KADLcHXpdtqr
         BugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        fh=XgF3qWx96IBWKHoWaJkHSQLVehMfkMPHr5hZvGC8QAw=;
        b=BoZFNMnjpVRfUpfv4OkoiHej05zszubWox1kgNHjwPrrEiHb+b1ODIGT2xpWxtgYWt
         ZSvwCvpBIX2iTUqq2jcc5pXjCB+fAFyFrlQyP5fmBjpwphIxWE7Nc3TmzdA7yxAxi8C/
         yiwB/x8pIYkvVkFRd2Pk+tuHIyIJGdqyIXKImPL5y1UewN/wmXrImBFg4EamefNpaqqi
         Ta5d2LsSiZZr0IdlJ5Rll31fYTF4Tabk78Fs0VsBRI8xvYvO5OnvccZXvFddJOPGdtfP
         5AYkxPJAjQhnwqzmCd/cet3rakO9/GuugtcblOi2XEaMbG3aLxCzxTEIQU7kUP913w8c
         Rk+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779819719; x=1780424519; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        b=SWerNJLQMBpd41OAIp1M177NMUq5yYX1RSw9CmvEJKDGXPRKwpwCDyxmUNLR2WQLK2
         3AGJQoVFXDqzCmYkYxGdagAaTGZYiTAZo7JSNBk11WfFLqjWStLrqMJdVBuIHAYJH+QS
         UOZbN3pbfalYYez0tKRd1NY98a2EoWvm/IHssgcjTrQr6g1t1ZKjS6bnHJJ0OS1ocBJ/
         VYCY6KjV/hwJ7v3VnFrR7wDdbRP1Z6T4eR/scSXjIFQ9kveSW1hnk40zj2NA7QDBgjRu
         u0yZflciBK9MiNlF6y8ouoSIezf/wGhj3V/TJRde4OuDKvAR4pGZiQJJlAkwvVLNNRJk
         /MWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779819719; x=1780424519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        b=LWCdrp6OgS6ioigYX+R6P9j3d3lK7i4iMPQUPuHrpHlvptITwaK2DixxHk7IMoIuhY
         slmQ2T8i262LJ7nts1uliitQjlmpsVcCqtvls/dBUkVpo/yUZozLYJR9bPqbH9QalgVs
         J1Fn/uMxgfx5Wx+E/oWgszz/1KF/4Ni5XAaVNi8fSecduEddJxe3Do0FTZ6lhomYYWBH
         XxgtlZyMi/IhqwlTAD3GZOo+SXx3k2sNIcMI2Ux4O+tTK4jfFJ5mJhmbQnJ4Xh8TnPBk
         1bksWctTS/MdWhXeDI2acO34Ld43LucAaV+GDkDPYSSehwBAKheo6ZF2XAllBtYjHvw/
         sZ+g==
X-Forwarded-Encrypted: i=1; AFNElJ9sxEA7Y3JDb+ZtPZD4AfZ1nrglcn27JXKosaoiT1Jty+BpOFl2d+7IsDG9uoVpYRlOWDEoC0eOHg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz68UIoxpyCLApEKGRBdobvR71GmZKONyZY5nVAlVYmyUH+OdsL
	7h+XNIVBzR3iIYvHMsbi0Rp8OdCNzGcJGo4+JgqDus7PwB+gW6/2uSWdBPuBvnS9qynHttQ67Jm
	yb/awZJlz+7mkEKIyBgdVGAn5CH9vDnZLt5so+Dg=
X-Gm-Gg: Acq92OFaU8Nqxz6SP6Nao5gKynOAl+UqOjRyHbbw96zr+EgboInDvZSRU1HN8QaeeUD
	eVU7Dc5lV60TL+H/FT9HkxTidUOaedRD/sOClhh+2FtPTd9GboEwVwTMzpKKkHiRueQ2juKfn9R
	LlP7svt19a/6VH8goX0E7gWfnHw6JNCQ3Qus/wFEon3CyXjtkTxk1g4xJUZPKUJ9HE5miXxS5yp
	TZdESurRXrL99smJrDi8DlH3n7gmgUOemHfyREjdX/tPmc5DGHcEv7mI22bEUKWBlvVKBBcPPgS
	sThuzapcRjMGCL1Yj1QJ8W2BM+eUeAKioC9HLnw7EClSSMgd4PGW6XiUZQ01xYjidqVWxYk8dGV
	C5dMR9PVMcSjb7fa1UdP5fcY=
X-Received: by 2002:a05:7301:2b06:b0:304:2af3:5fef with SMTP id
 5a478bee46e88-3044921564fmr4123223eec.8.1779819719412; Tue, 26 May 2026
 11:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525202921.124698-1-dakr@kernel.org> <20260525202921.124698-3-dakr@kernel.org>
In-Reply-To: <20260525202921.124698-3-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 20:21:47 +0200
X-Gm-Features: AVHnY4LERaGUubmcoHWuZ6pDVh-Er4DRAsv1wa0D_Oc3ExDNDH2ULqOUOsIQmwA
Message-ID: <CANiq72mNqdOmQ3Va=EF-Fg+-BXW=O=px4z4+YQTS6wzL87=ZHQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/24] rust: alloc: remove `'static` bound on `ForeignOwnable`
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, viresh.kumar@linaro.org, m.wilczynski@samsung.com, 
	ukleinek@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	abdiel.janulgue@gmail.com, robin.murphy@arm.com, markus.probst@posteo.de, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 10:29=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> The `'static` bound is currently necessary because there's no
> restriction on the lifetime of the GAT. Add a `Self: 'a` bound to
> restrict possible lifetimes on `Borrowed` and `BorrowedMut`, and lift
> the `'static` requirement.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

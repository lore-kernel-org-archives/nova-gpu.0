Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343442;
	b=Zcg9iSpa8esVEPFBfkpbwfzMBbgr2TWJN8ksWtjk8BzNy63QwY2l6C/xX3D6cYArH1BF
	 Cm4S6soSYyimQhKVhXKr+dV6nv7mmWIy0OQWvVmefuMemssF6GdTQYf3SvCkeMywYcJ4o
	 5SMhmdJwpHn3ck67DxeB8rvF5EqLv+t3mkBXE8TWG/G/cTYdPEd+ybB714ujqWYvdHJLk
	 NeukJsAdneHn0QNQ8jzO0b79/NFexx2LlKTlma3VvE0QaOTfto+kZVrg6rQvbDEKvSPS2
	 H5fq+lnQiIVNcPDhs4kmss9sSZcdCL26HAehbi8NksxixTI72OYPqU7eDq7SGFyGg7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
	b=LAcHLCmWchz0kk+VFQ50dSawjNAzdRmBktEHtlXjUOx5Pg6KB1Y4QRwaAzgINZa1ed1w
	 1WNSLCkr/7Rar0MPsRlCCSGymT19mviM6WQs3XxU6R09T1G0PzxRwHhE1TKUqec+xEDJ5
	 Qd9oWb2hrL8TfWhyv3d28WLjnBohmfdzN1hQYk1F7XsDQUIJD9gc1ki9PVM1lxQR7xODU
	 sk0ZJrmzGl5XSDwNZ/lZ7hQXgZAdW58Fi7983MLAI7UqnTIrBMwntmNkWkBIH5GbNR6H3
	 9XxvDJSz0xzI/2+xofZoYf33L+vK0yKpe6eRbAmP3ZrquBO//l4TPbX13FSk3Gefoyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ShxIsiZV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D11606A327
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 20:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D11606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ShxIsiZV
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so22008765e9.0
        for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 12:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343440; cv=none;
        d=google.com; s=arc-20260327;
        b=BSMCbF/gj/1qNhMSmdog4i6TRk2eL+Alg9UC8L+XkGuB9x1453nyuYZ95PHWwny+B4
         ioiUi11TQXD4EoxYfnI0zwk6pTev0DFeGBZZpGJJDzoY99zUsh6PUMinR1jF/g/BeiqE
         +cVzmWD/47JIttuPB1AxHvsM2lsTJSGRcGML+lzxEbFrtEkBMPGgxP+54KX+bwHHTrSm
         AQ9M35uU4rRAsFhEzt15HoioXUYCqiQf+B5sqsouqXNspmaoJFuNeY/FGOYL/z5w3Ejn
         PqIWSSLmW/7UrgUC21RLKLSvpGMMuWaiHMW7kvD8STbxJyZyrG7O1AWKZ27zeP8Lxzcz
         rHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        fh=MI6ZjWRV+kVgPPR4M+xt2EhdnPzqsza9pe7ESZDQwjQ=;
        b=OXXvy0lHLx+1v9xswhZLNZBaryA8lybqY3aizLiD1U4/b7gL43yTm8Xe5LENrEV1Ay
         M7QaQNdwsHP58SCGwQn+eUoSzjnJ9UKsTg4xfRsyvOvO1zu6th5MK7AoxzMz1dC03Jvk
         itadCeHQKWrfLeFNXwlLtVmbOXZb/cVsXCTXzLAvL5t7o+ahxNLa/e8dvqkWDArKuCvP
         IBk6JQP/gBzWqLf6cxAWF7Ds1wktn42aNn1rjw1IcIQeGv2itNnBnJkXa5UG7GlpGHfx
         JNHAeOIT4oNbcL4RMK5U/U51eAqnd/4gIp1eB8GBobYVhNwj8Dt6ThLZUbqEN2Y0/BNq
         HLwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794343440; x=1794948240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        b=ShxIsiZVGWACWl+ieDYqzRg81CCsSNsIJRh5J4lkbd2xNCwCKObkxNM5k/DmPQGsbm
         nuNUPT/AN5yEVrpZrZ/FxJtp3TcMYANSOLXat/4L05XSgioWEIFWHikjaMByG7s5+qMu
         18HJ5cNNUr9S6GgLTl5NENriiIGyz0Km+d9yUaDu8n1C+IugqqEs76jq5WzsadJy506d
         qxK68ytSLe37PhwqlZTdcsfNmseXAfunvZH/B4pe5gW2YK6wqb6wjfI4BdRjos8fa76J
         jaHPmLKyL0nW67UQYqnuSZHR7PmVkkPT8DzGZTLZmaMEDscjH02ibXIJ75R+D0oaNmk6
         QYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343440; x=1794948240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        b=yhQvGRixPZjj41JrCdcIj7kAg6okMvbffuC9Xj+M/CuaS+f/xf8TcQHDYFM5lE/Sws
         +DQW7XcGBTZsRfJpEeCtv9T4DtpADBS1ftdtTT6u68A6cz0zmnwpec91vTvyRLDoGTwt
         I7rDQI7UbVEBdiOS4pUCQC90c5OsZKz0nWznKbPOHTCmuv46SWTpRGvepZge6j4VK2wr
         yCsIi6vPR1PIRfszErFhgqaUorRPJ+Tg/AsxZgHKlnqur6w8fKvtJupQTUyaB7fLCG8f
         HNPqahRAyZbNdR8hlhcXThtlxbzT4Tyy0Dr45jpKOVEz0utr3DtBsn5gzIwa8KxHj8gE
         VGug==
X-Forwarded-Encrypted: i=1; AL+hErFEDGV1ko90Vb4gc4KnjFzkBgpPSRhW8HPG6l17or0pEy8Fo2Z7Kf9/9D7sRxVQyx99ATJV0qvb6Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z+bp7yPQZbzE350VdKxQ+XWleri6PNyEgW/zeuIwlrH5NsXVNQr
	HPNP9qxKgx4fhig9GR6xjsTssdZKQ0ou2Y9nS4P5g+rX429uM/mwCOSteFa1tdPyKgVpn1oShKh
	JkOOuiG/FhuobCjgrSLAWefL0+Etq/yVglSBdDenB
X-Gm-Gg: AYBFou3E4Tjh/wd6JwWMr6xEcFMbeQgYnuQM+ee78l1sW0UL6oWQeemmAh0gKzwAUoT
	GcS75fPPQzFUuVXL5QjN5A8+f1d2KwjbnpJKoIocW9KKZ0QsY+CPG92hj+DY4eQPuVL5X/0/iVp
	O+vgh3yZGs1mlILFTF1kECnjPdnH79TBwhiGLi8wTmVmOQL7vQY+t6gnb2iYOQhSJ6wbyiBsR+H
	dSctfeMUlN2BMTpkLVAlhvufSo/3qgGjnL7KMMsas46ZmTA33frtRuqlHh6Nz/7q+m7dok31Ts2
	QlCp6Y3l5dg9quJxU/JEMB2iJAAxqBtZoB4EFoG1tEuKQyIdaNSQgCjljhNHrcVvIBk9BLwIfdX
	SdwOtS6f8le0jy4yj8SLyl1NbO8JuP8w49GEMmhIp6zYWsAZbsON4voT0IDCjuNAvXHk6i4N/YH
	gv3aWynQQnconjX1U=
X-Received: by 2002:a05:600c:354a:b0:4a1:7e77:c382 with SMTP id
 5b1f17b1804b1-4ba0935dbe6mr4583165e9.5.1794343439620; Tue, 10 Nov 2026
 12:43:59 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261107021427.2105374-1-dakr@kernel.org> <20261107021427.2105374-8-dakr@kernel.org>
 <au7eV0D_44ipe3mw@google.com> <DMP0HGBVA3Q9.T8UP93DA34UK@kernel.org>
In-Reply-To: <DMP0HGBVA3Q9.T8UP93DA34UK@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Nov 2026 21:43:47 +0100
X-Gm-Features: AclHuK_M_RBnCdkeBBogWw-mSzZ7FX9o88E5X3OuiqD9l_BOcZbdHx_bNnfG79w
Message-ID: <CAH5fLggzEvheweiHte5KTaQi4G_5GtV02krR0OpXB+buDUORBg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] rust: drm: make Driver::File lifetime-parameterized
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, lyude@redhat.com, 
	alvin.sun@linux.dev, deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Sat Nov 7, 2026 at 9:16 AM CET, Alice Ryhl wrote:
> > On Sat, Nov 07, 2026 at 03:03:25AM +0100, Danilo Krummrich wrote:
> >> +        // Run driver destructors without `filelist_mutex`. Take each=
 link before dropping its
> >> +        // allocation to avoid recursively dropping the entire chain.
> >> +        while let Some(mut data) =3D files {
> >> +            files =3D data.as_mut().project().next.take();
> >> +            drop(data);
> >> +            drm.open_count.fetch_sub(1, Release);
> >> +        }
> >
> > Instead of transferring all the files to another linked list, how about
> > taking them off the file list one-by-one? If you release the mutex in
> > between dropping each file, then we still avoid deadlocks if the file
> > private data destructor takes the lock.
>
> I did consider this, and technically it would (currently) work with
> list_del_init(), but I did not like it because it would be a very subtle =
change
> in semantics from the perspective of the C code. (I.e. for C drivers the =
list
> entry would remain intact after this callback, whereas for Rust drivers i=
t would
> be removed.)
>
> Actually, I did hesitate to move drop() out of the filelist_mutex protect=
ed path
> at all because I don't think there's a way this could actually ever produ=
ce a
> lock inversion, but the "move to a separate list" approach was pretty sim=
ple and
> very few code so I thought it's worth ruling it out anyway.
>
> (In any case, I'll soon start working on the C code to implement a common
> lifecycle scheme.  Once we have that, the Rust code becomes even more str=
aight
> foward.)

As per discussion on chat, my suggestion doesn't quite work. The point
of moving to a separate list is that we don't want to modify the
existing file list.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

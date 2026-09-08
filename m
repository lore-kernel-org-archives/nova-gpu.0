Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0174B46C4BD
	for <nova-gpu@lists.linux.dev>; Tue,  8 Sep 2026 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902459; cv=pass; b=L7Yg8DdfS3y6TPhmYEpwY5nmcGsdFM/BKiVI14b+rhCm/Z2ssFNcb0+1J63S13t6Wr7l9CRuN8DUJv4XVak9vBdY7F/cAJ817nIgioWgQ8pU0N96KzV2a49fu4QJgrfogo1TxdpYW+ZrB3OoC1fJeEi3gLO549yAEyYHtmkiBF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902459; c=relaxed/simple;
	bh=UwTlE6O+arphbaF2nVtTqmf7C/u3HA0Dq9U1XFRrceA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgZmnuLQHshEX7OkEnUDNt6EVe9vM8Zg5nZq22F9/3quaEv/4VvnHTKlbA1li0Ucbqu58wQJ9mU90MMS4rgkapgqWccOOpTP3D/P413fPDctL/T84TeCxtsbID4ArmaIi6F7XseRvQqNtUBe6dZ2a9vIViHtNjYGF5bpMAtGEk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com; spf=none smtp.mailfrom=darkrefraction.com; dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b=lW8og/06; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="lW8og/06"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so4354530e0c.0
        for <nova-gpu@lists.linux.dev>; Tue, 08 Sep 2026 14:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788902457; cv=none;
        d=google.com; s=arc-20260327;
        b=ZHUM/qma6LVfDjd0gJKYhXU80XXllI+gCWbEd+QcJ0liH6Vc49xdSla1tsAw74VT99
         9ZhXiXEHoU3+2zULrOUd15JRg0PfVanuHxnPY3LtZrmlDC7znQtOul7VlyddGsxtLwFG
         pOWmSwSeTkj8uxQ3/qH1K8u2LWXRWQCB7kkFkhrBqlpZZYsFbnVSHogv1Is1yCWXWwfb
         mGBXO5L7uvVTW+ESaYcN+UBysOWPg9zQy69DG71eR7V2+hGlj3yqgEXwlPFeQQDmuZD5
         DjM5mMMzb1eGRailTJISCHTycmgf4VlZ0BJ/4TeN7s4xNmeUeX8tKb+C7VktzemEx6Ce
         fuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        fh=U39zeleaQFlS38A0lwy7YFVXyaHjgHHmCVY9lANQxlc=;
        b=R44TLP8kqt79Ezs8PzbLC85ufqXLbz4W3/mnidSgSXdzfBoAlh+ECFT9gnjWgxWUau
         mHd0jWTeN2t8eRAI8OZ0ny3Efk06GTmRbtV8Aj5B3aUmSTd04UAzvPcMLrFq3hX5JoqG
         h2fKfgRDCIi2w/F00/+Tee31EiTbQWzhph3mCJLna5n3y2AvGvwJdR3j+HcZxDl4nDmg
         ZYtElrImwzbVoKnIHQz/wT3cugus18/Az24lH7/jRAtPfjleCRHJz/f4myDa8nEZOXWI
         6gtvPASY7x/+KO8X6SXNNBIFV+mI434EQclefgMOE5bbcCF/G8gm4og7stnX+dOHZypc
         JMSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1788902457; x=1789507257; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        b=lW8og/06c3Fl2TvRmFX6IEjZwKo6MdQldEGU17kOD1ZkW1ix7WZnH2Fu7tJ1F/NmkW
         JaXzmt2z+6+yDL3wrNjlVLVYtyY4upnnfjHbftFNs9obAsEYWbEhVp4PGksom2PmbddV
         wkqiwpklOa3R/ifbLpdW31ZksId68bUQVF3E6tUrs4oWFRQnfpeMEDlTI4scHumyN4KC
         bIwKVkmjJ7hKiye0RjzYwrp5/sOVXQv+7UugioLwSPy+Gtogc1c9t2MIzegnglZIjgi9
         xHpqX9CLu+CFmQ1D6qoDibeLoYeIRHpotOZxqRF+7fyW0TAqAmwSp4pliA/cn1mL0Ten
         zAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902457; x=1789507257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        b=Hyge8AHcUlryVZDxIwYprKldzZfDmcowzrOmVj4yMiEpDPBqE8gUFqVEXr1Axl7NPT
         RxTU6fX7JBDEbg+rCsq+NYtWXRBVFbu26QqXRgb1uB45rR0ZN/fPl0rZxYOvgWOl3tH7
         SCzonsFzxgG0IOvnVZD5zsGvpSTM47dChWSEh02AAXJhG9zCOK5J4g9htM+d5H9/tNBM
         vn0Ssp/J3BBvYK2zRGuOxq0pxklX8lA7K/3Vkj0ubNCqFPrlDd9EEux3lIo9YMe4SQzJ
         G+BwZQY2g7IUOH6Ad6tkpfswgQTsHQVxQ8pv5agY7VuWFIWzQURCi8Vue2rBQAlfa55e
         zpvA==
X-Forwarded-Encrypted: i=1; AKwUvBzlsQYIllr7voEGjThRlsbf+4pr0CQDXZeVVslFzSiNo4iMbQZhQHkz8px06t0nDFgLraiPCTRygw==@lists.linux.dev
X-Gm-Message-State: AFuF++mCmswNh0vOyiLiSc43xD6oL5nApQljQCh7yV8HasfSpKbohqkX
	LcLbaD7N301D8hDhccClLjBfhE2ckBWQgeWBcKhbIh1lnmx3c2w48BOZNB/py2wm85RpMmSiAbk
	0kn+JUzmyYG1RqmqvRUj+UCneC6HhMAAKbd84oH2vMw==
X-Gm-Gg: AYBFou0iYfcV8LnZexfhJOs7vau5BCbykjnAlgaz2nK8AMZbXvZsg3M3Kd+xBZV1las
	x43+cVd2cf9sqhgnIt1nFq2zV9MJOpGGMHRIZOSxQU0EAWJ8NNeuyBKnt5m+doQAD8/x0OH96MH
	S+7dqT/39OpN7K9GQZrR8nnWCLriFYILyI2zRB99HYPSchgUZgf/t1OPuqC8V/y41OgBd5T6cUj
	rIc9hwwc/0a2O28YO/OsMefshgjxNSOgq2mudqpvPP6n+B3Ux1OKNoNDwI8CnbVQq0VXlrxnA8i
	9Q0+HctCjU0JANNJp0ob4cEt0PhXPdN1svtssX0UllEF
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id
 71dfb90a1353d-5c7ed846723mr18349037e0c.8.1788902456679; Tue, 08 Sep 2026
 14:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org> <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal> <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal> <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
 <CAAgWFh2iPJzQ5PJfFpPBTdgZ=GFjy7Eoz5C0e1WwFMuOuyJSTQ@mail.gmail.com> <DLA3DUADGEQX.1Z2G7Z4TYFK1@kernel.org>
In-Reply-To: <DLA3DUADGEQX.1Z2G7Z4TYFK1@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 8 Sep 2026 17:20:30 -0400
X-Gm-Features: AcwNN1WUDXxoNO6V6IWGTSyf4m-_qnTdLZpGwBIrUYQYwOu9jMMSrLkSn7q6ieM
Message-ID: <CAAgWFh3FoAJND1wS6Wu_taUWPYGXpawEtKUiAwR3HpjcqXyWGA@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, nova-gpu <nova-gpu@lists.linux.dev>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Sep 8, 2026 at 4:48 PM CEST, M Henning wrote:
> > On Thu, Sep 3, 2026 at 6:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >> Because userspace otherwise has to figure out the architecture itself =
based on
> >> the chipid, while the kernel already did derive this information.
> >>
> >> There's many ways userspace could do this, and I don't want to incenti=
vise any
> >> of them.
> >>
> >> For instance, you previously showed how userspace derives the SM value=
 from the
> >> chipid with sm_for_chipset() in mesa with its own lookup table.
> >>
> >> Then in NAK (src/nouveau/compiler/nak/ir.rs), there's this code.
> >>
> >>         fn is_turing(&self) -> bool {
> >>             self.sm() >=3D 73 && self.sm() < 80
> >>         }
> >>
> >>         fn is_ampere(&self) -> bool {
> >>             self.sm() >=3D 80 && self.sm() < 89
> >>         }
> >>
> >>         fn is_ada(&self) -> bool {
> >>             self.sm() =3D=3D 89
> >>         }
> >>
> >>         #[allow(dead_code)]
> >>         fn is_hopper(&self) -> bool {
> >>             self.sm() >=3D 90 && self.sm() < 100
> >>         }
> >>
> >>         fn is_blackwell_a(&self) -> bool {
> >>             self.sm() >=3D 100 && self.sm() < 110
> >>         }
> >>
> >>         fn is_blackwell_b(&self) -> bool {
> >>             self.sm() >=3D 120 && self.sm() < 130
> >>         }
> >>
> >>         fn is_blackwell(&self) -> bool {
> >>             self.is_blackwell_a() || self.is_blackwell_b()
> >>         }
> >>
> >> That's two unnecessary indirections for something the kernel already h=
as
> >> available.
> >
> > Userspace mostly uses sm id and engine id for feature checks, and I'd
> > like to keep it that way.
>
> Please note that I did not ask to change any of that in the context of
> chipset/architecture enums.
>
> What I said is that I don't want to incentivise userspace to derive the
> architecture of a chip on its own, given that the kernel already does thi=
s. (If
> it is never needed, that's fine too, then we don't need to export it. :)
>
> Of course, architecture and engine class id can't be used interchangeably=
. The
> engine class id is more fine grained. For instance, the engine class id i=
s
> different for GA100 compared to all other Ampere chips.
>
> At a quick glance the code above looked to me as if it doesn't care about=
 the
> engine class id, because the granularity is architecture granularity and =
not
> engine class id granularity. But at a second glance, I think you are actu=
ally
> deriving the engine class id and it just happens that the code does not n=
eed to
> consider e.g. AMPERE_A vs. AMPERE_B, which is why you don't have an
> is_ampere_{a,b}() accessor I suppose.
>
> That said, nova can easily export the engine class id information instead=
 of the
> architecture; the kernel will likely need the engine class id anyway. (Al=
though
> it depends a bit on the GSP-RM API, I think technically it could get away
> without the driver passing it in.)

I guess my point is that the entire compiler uses SMs everywhere. It
largely only knows what sm you're running. The is_blackwell()
functions are helper functions and are not typical of most checks in
the compiler. I don't consider this "two unnecessary indirections" and
I think the code you quoted is fine.

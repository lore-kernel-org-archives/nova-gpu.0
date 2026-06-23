Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995081D5ABA
	for <nova-gpu@lists.linux.dev>; Tue, 23 Jun 2026 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219047; cv=none; b=XT+5kFYk0GOcmn1/5DRvzRzyEVmhjqkGV8LklJON43GtnC880Ga9etYpOW9RwFPyQTIQJVnjms7Mve1NVEdejl4cXaF3iVld+TBxRoVg1TCkChKYMU+NXRZdCRzY4DecU64JWCaBfwnSKVDsmFGen8lTSWjPpCY984Gq3fnK+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219047; c=relaxed/simple;
	bh=TOUR2POP2vlf8YUNKv3dyet+eahX6OSdriA3fkqSbFk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YBKPSg4G3kZ+me5rjbReO5XHbhWo9/L3XaWqsdQOq0xrGyfFcHM6zofsXw7so+rHcXNC8q8raBLCpQEh0H6C8ejeDtZaGc1HqLBBH3loWDLrTfYhK7ZGMFm6l76bEQk/XHm8dBqYBfBLWJ7WcvENW+yWK6MrgiVnm3zvakIUr5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6wyLdMp; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6wyLdMp"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-519f9f13b06so38482021cf.0
        for <nova-gpu@lists.linux.dev>; Tue, 23 Jun 2026 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219046; x=1782823846; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGj3g1KCk+kZNll4UB6dOm+IXncrIJjrxvMy5Ft1TB0=;
        b=A6wyLdMprywZCG4Di/xGHXB+7wVQiNPCyOaqt1G2iBBZgWPmgcfKVVyh0tG5j6DmfA
         gI0M5XQfNrTam7b9sZVFdYrSG0bG/+MTfciVfhlQzs9awepfkvQeB3uGkK0F/lWUWBAq
         dvnMgTihwCc1Ywnkw/5R1MSHlJ3SFLEJ0MT7lD2/9Q71uxjD6y0Z/+aKsMpjRltHZB4X
         DM4iOn+27Pgy12Foss/ICL7KeV8Md7tjGW8fWTQH0BkRqVmuxwL0MfPnPgRBn7Lhn0Zf
         kKTaP+BBC+7MRU7DYPScIhXwRB//4x5KEDRZlW4qbJtWLmmrg0OZSbFCp47uu9Jn+2ml
         eXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219046; x=1782823846;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGj3g1KCk+kZNll4UB6dOm+IXncrIJjrxvMy5Ft1TB0=;
        b=nxxwFH36mqnq4nFX56M+xjaZ27zEVPpqDCtPg7LJZAzlCklgSuKHVybPBN+aiZi+w5
         QOHHlEOHJtPggN1QSEvTznVfSYOShc5ratnptbM6ZMjodfo1g7UIIe9/OcT38OxmhzsU
         OJhf9ygiK0b/xgIcCx0XyU/MeOXFiiDSE2f8ey7KJNKa7C0uepv0tHgBMBYDBpwoVsBN
         GA32TD/MZUAZrHFTMBx+ekQDqzsMzMsqP00Fflfe4gzLn9kfQgRCzSFs4WshIbJZzkJ3
         7Y5ChtKzGHrafXlXz5VIym6tP1RlIO2nHOkEvDLGwPkv/vHCYEhT3A0nhwKXuwaGPPnD
         +Hzg==
X-Forwarded-Encrypted: i=1; AFNElJ/nBfcqX8ONWLsuEi8ZG5FZ9ssJObvlSNRnWm2KuKQuBZ9ut7mV6BaTPp0AQO6rRnlUtX8sF6Z0nw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnH9aMctj2WPMIq5rFvAltxtyIzQJJ9/TUVVp1SOxsT1kyxhmC
	yuCVsVal8FFsrG25XuqSyV0kMSdYNdnInpsRe+H2ubq/tybZ+2/kTuY=
X-Gm-Gg: AfdE7ckqfjGmUiaJcv+1uh0WpY3gwBtqxPDc1ky+uuJEdj8Fps7ywi5TkoNYCzjIk5A
	ZDfxjG2eJftOtKi2h0O6Xxhp6yhRmy6gApe2+DpclhpWB1j4uv42jXZqn20vq7ePO6I0VSR1Esj
	NbDYrq1rxUHWfk1M8m6yOMAwEgXk0Cc9YZCO+Ow8h8Vatxa5D2T3PTZnh0c477lfJTwimU9evgI
	1R6whwZiXMN4HDwg0Kh4EveriGAPPJD9ZvZC4lb7UP2yqzC/iy1GDbr+1b6/4cDqcsz7q+7EftI
	eN5y5NGlmiYzk5V0UZAV3XvZAxuz63FKUPp/SBUTUv/w21g93Nb5WIxg3a2dTk40yplxJpiKAFP
	stAXLQcYT/egT81+81Qay+L79iDdcFRNvqiqC+RIoyVjfbcu3vNWEStXkGTGndECets3M3AZcZv
	fyPMraY7n5HQdDGSlWpRmTT/md/gImDe1QcmXEAE+iAdOoujJ0
X-Received: by 2002:a05:622a:408d:b0:517:917d:e3d7 with SMTP id d75a77b69052e-51a54807d1fmr37051071cf.28.1782219045378;
        Tue, 23 Jun 2026 05:50:45 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51106a09sm22340861cf.0.2026.06.23.05.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 05:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 09:50:38 -0300
Message-Id: <DJGFX7B3FJJP.3CI7CU0US8FYB@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Tamir Duberstein"
 <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH] gpu: nova-core: parse structs via zerocopy
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260621143647.264770-1-nico.antinori.7@gmail.com>
 <ajjj1yyMcrCA8H19@nvdebian.thelocal> <DJFUZJYZHOT1.M74T83PJE8GM@gmail.com>
 <DJFVRMR67B0W.2AJBHU1PWDPFT@kernel.org>
 <ajnPpyQcirSDIZTu@nvdebian.thelocal>
In-Reply-To: <ajnPpyQcirSDIZTu@nvdebian.thelocal>

On Mon Jun 22, 2026 at 9:23 PM -03, Alistair Popple wrote:
> On 2026-06-23 at 07:02 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
>> On Mon Jun 22, 2026 at 10:26 PM CEST, Nicol=C3=A1s Antinori wrote:
>> > I did my work on rust-next [1] because drm-rust-next does not have the
>> > zerocopy crate present yet [2]. linux-next contains both zerocopy [3]=
=20
>> > and the new users of transmute::FromBytes if I am not mistaken (BitTok=
en,
>> > PciRomHeader, and PmuLookupTableEntry), so I can make the changes ther=
e.
>>=20
>> The drm-rust tree is a bit special, as it remains open for contributions=
 even
>> after it has been tagged for inclusion into Linus's (including throughou=
t the
>> merge window). However, all changes staged in drm-rust-next are not goin=
g into
>> linux-next until -rc1 is released.
>>=20
>> IOW, until -rc1 is released this may or may not resolve all conflicts wi=
th
>> drm-rust-next. Once -rc1 is released, it is backmerged into drm-rust-nex=
t and
>> drm-rust-next is picked up by linux-next again.
>>=20
>> Usually all of this remains rather transparent to contributors, but you =
hit the
>> case of using a new feature introduced through another tree before drm-r=
ust-next
>> caught up with Linus's tree (which will happen next Sunday).
>>=20
>> Before drm-rust-next caught up, this patch can't be applied anyways, so =
all
>> good.
>>=20
>> > I am fairly new to kernel development, I apologize for the mix-up.
>>=20
>> No worries, you did nothing wrong; thanks for the contribution!
>
> Yes sorry if I gave the impression you did something wrong - this also to=
ok me
> a moment to untangle as an experienced contributor so perfectly understan=
dable.
> Appreciate your contribution and hope to see more of them in future.
>
>  - Alistair
>
>> - Danilo

Thank you both for the clarifications! I'll wait until the backmerge
into drm-rust-next happens, then I'll rebase this patch along with
the new conversions and send a v2.

Regards,
Nicol=C3=A1s

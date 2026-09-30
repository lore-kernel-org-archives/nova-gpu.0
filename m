Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75443472F86
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767384; cv=pass; b=lPDfuJhABb47m6ga4KqntKt26tXGc8NDF3oo4yGWvIGtHc7HMtAfwpQwzMgdYAwI5qvka5J033hlCruhB6/3Lqk0cNEAadf2z1d7Unr2H4P7Xdb61dleigRTus/1cUSclu9ixtN/Twu4DjsRy9YRpWBSC3eVYxJYejaFewfFgSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767384; c=relaxed/simple;
	bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4CLk+pxoyp22ZAoYx5LNZA1gBz/AI3T7OJCm31WCvWwcrfMu+B3y8x3WfYbxpn3Z99OTSUaZp+Kx5BWcI9tLiiKjvPkaLUQA9u3Wey7LvbHpNY9PJkZiLAwkLZGxYloe2NKpthxcwOk4QnvhRrcF1WRNif6XmURzTUm3LKcYOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPZuM9gB; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPZuM9gB"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32be7127c64so593267eec.2
        for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 04:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790767382; cv=none;
        d=google.com; s=arc-20260327;
        b=sbd0FEVi1VSoeJEp7ITj23syCbtt17nrfY/jze0yCZo2FApvTcZsuAJs5Jwauc4Tk4
         PnhZkOMjyJ7NJnkgmCGqZtdI/3E/sBrchiSa5TMPCkR+1g6+Nywzn56GdEaQcpu90JmL
         BskFjBrIZiMXv62H0FzpjhBurGhoenHvU168bzB+mPjbSJBDbCXOnF0tMSbHUvQLiIbj
         Bjm8DUHFMEahE+oeIl8shFF3Ib1Ck8AD9iALxjxrDKCqltxGay2RKHCmQ2UJXfUwoiYx
         SJzG2Yfa8IXZHqws/Jas07K3BHfmL/0DhxEHydgazFfT2HmvegXzbrvw86mZB80QDnn5
         O19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        fh=F/HDOx9QZRHJHbXpf0j5ou9+aSO123BkAmUdegsHe7k=;
        b=bCxn1pzZU8xk0SCMtcANZJvK/5ZXbwdDOS13gEfBbN/DgEBxfLNJVXWwkPkD2Hjyg4
         YJksWz7kLnsybT0+XZu43E7OJtiwu5n/9JxI5wUqCyC+/yt3oELWtY9VSY2oCExslPWw
         vBk098xrFAt8+M007mQlRdumejyo+Up+oyD6lv4w13VVO4amTEAD+IReWm7mq2xxCsXa
         47mtk5N/KZty5l1eHrMP1KkTxFv3esUizglqZ9ZOuK/Mol4rUnnGWH/FGKr5hZvgjfHp
         VhSIcquP8V+ggNFBlv56EpR/TsoFGXJsakFmeh2Wpl2oVpeJt/7db2n74uhGGQyOt3FM
         H+kA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767382; x=1791372182; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        b=XPZuM9gBMzJRRawc2y7kPoLSSMyssPB8hHJsxJ6tsrRbZ8Cw4gtu+A2N+22LeNweM7
         E53ov5dbpagfpCurmun8JRPbqzCtK1yTDfSyRaaFixnlQ//IiFup4Nf63OErCFT/FTiq
         MMJF9ZJHsoemO2370nEOYk2EhBLyx7K2r3zZ4SSns20uU4rw4cFpWLhlpqsmyW4G56Ai
         U59hPzTj3ebipz4P9mG8t2AsPzCKonaQGOM4jPfXP7i+sTaEWkkZZj2wlk8e6lbbTdjr
         +JwhhZpfbHb2zqt9KXNiPLGKLRQyIvck7d+ZMVTd7bgoq5M7v9yRYf5iI18CTBs4klHB
         lEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767382; x=1791372182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        b=QF0erwH7Ub/5zjxXYIVs3epwj9fng+hptRpBzcgvWk4WF5BH34Of/9lMiuT0+VdVNJ
         nLPfJcWjYaRJPHkGCAeX0A1KgWOjDfW4LyGBPUvlFrHOPahKFTYwREXNZwwo4AxCnNct
         ktBKLD57hDlOVIDMzyJLGkQJfxZenXlPAwvnfRcD7rKcxGArb2e7kUEIxo2sfkF/g/vO
         4MiKUTBAyQE9fioYdCLLMnMaVWiRsUOVpcbsN4cSEmjXVp/ccmK4Cos+8TG+IKZj1qcG
         C0fyiEHUZGoGvhFTrilMuSjyYLt7Wa5pLNN635PPojh6p22emYzPLGgxGJ9oOVZQU5qX
         GPlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhf0ST6TRw+wXzxL/39Ea6ZSf22EYSK1QDH0x1LIpRTMWWEc0wKV12ape3UON+IyyWsdbAjlxltQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK6N0dXKHUby5N3Aqk+ZE6Dri+tj+17OXnMQEKF3YnzAeBu5F13
	u2b3UKcmX1+KC7egknf7Asc65R+ks58ODF7l3zDmushPMdaCEJ+IVjkG5E2Nt2uU8jiL6fsvWG1
	OGOdv5/ohyp7zR7JEoZVHBi6VCV3v4Z8=
X-Gm-Gg: AYBFou1CBPgNVIQ7pS+1Y7bvOSOifwKl7h1mKHiUxjzLpT1gciLI82ZbLaRxuB8aKS4
	mlU8alnexJWyN8dVDBAFQ7NWo+W5psg4sMJQ8xsfA9tq7mAvVCpz8t992a/HjGAMcICsjJsrzmK
	TUK6dO8bNL89KAIgI5BaD/7FYA97XlEljlMKGiDVIQWxokIE9BTfVf22pYF3xuTgOrIkcR0kLcd
	VWPLJHo/4N2LM7WzwsN25CqYTVSSZKIEFgpAHehojrAVTQkWh+SEvPjfwFrlNM+GHrUCARa08hy
	gFh6RzmjMnc2R85EDWRCQjQH0RXReCHyY5E6CLLgvkI0VlFF4TS2jnycR4/5tOiuBHBLgkiJ9xa
	E5gkk2ReTOVEvH7I26Rfh0oZfxOR47LzFI1wfKsk16HvypizZgCACFam3MU5MzUjat0rB/nukpy
	e+mCv0ZbJ32Jx92jM1ffYVaYQRt2JD6aXAcEL+pvegPj+eg5+PRAo=
X-Received: by 2002:a05:693c:8085:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34cf1818b1fmr2066899eec.1.1790767382465; Wed, 30 Sep 2026
 04:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
 <CANiq72kcqVfvVj_b7KTHKrCDj63LMKpsfP30zafoYB8c924i2Q@mail.gmail.com> <DLSLNL9HDUKM.HN7Z0MACZZSB@nvidia.com>
In-Reply-To: <DLSLNL9HDUKM.HN7Z0MACZZSB@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 13:22:49 +0200
X-Gm-Features: AclHuK_tZvjMuy0Rny6WfvK_GwQlWAvr20_A4Fja8oGIX-etyz8meHHBtoM6IgM
Message-ID: <CANiq72n5jjW8U9VkYJZYFpL9Z5rPe=nRfs3DqmUdfxCW39oMgQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] rust: sizes: add sub-1K size constants
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:04=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I am considering picking the series through DRM, but it also has a
> dependency on the `cv!` macro [1].
>
> Is this ok if we take the patch introducing `cv!` through DRM as well?
>
> [1] https://lore.kernel.org/all/20260917-cv-v4-1-547ef5727451@nvidia.com/

I asked Gary yesterday if there was any more recent discussion on the
tag thing from v3. Does anyone want to do some cleanups this cycle
through rust-next with `cv!`?

Cheers,
Miguel

Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC12361666
	for <nova-gpu@lists.linux.dev>; Tue, 18 Aug 2026 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085859; cv=pass; b=tTctV3LoEIvMnYl4fhAJUcYVGqfgrQqai4oSTdJlCyawERZS6HMhD3F1q8ajN178PfhCJ2Ghs1jOb7T6TJHXIPBXtER0qtP3QgNwZON976SqWkL+/yg+6mmV/ov/Oe7lA+aPJsTFI6AjYTOwb+gJhxQ8/sLkDmB4KKutQ6ppnNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085859; c=relaxed/simple;
	bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GeeNpASYKn0iCmFi9EmSada1Ih1q5VVYF6VN32gxkHQIRni8YsYPmidHm1B8yj3URWpL88zCT0xqv5qd3swIvGZuGhzGMQ8/Z0X4Rk49dP9mdAdevWMNXVXnAcDZpg0qEew7RkeMt1oK6VITimEuiZ0xmT6PbNYk/pQWe63Fo0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4M2eyDS; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4M2eyDS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d027b7c8easo631935ad.3
        for <nova-gpu@lists.linux.dev>; Tue, 18 Aug 2026 13:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787085858; cv=none;
        d=google.com; s=arc-20260327;
        b=sZuXj0i9temqrG+50pxGHgYKhhl+pDQEg7+kWQqS64ZYoGWNPtJ+epx6TKntSN5ura
         dd0gphlZ6jy0rJyqCcHl/ScukiMlS8s2sYUd0KChPD5Mjc3egdg/ZICfzKlEKv7fDk1p
         ahjR/YRmKui96+7SXYFCTQACYIwns3c6nKwpXjwGqbw5+9pfPRhagw3ZM0KP3AjztyKm
         OrqYvtRv9vQmivKYcgdREJBZucaw4/i+cR0kkVH56VLJ7qOVU/im4VrKCLbWEmx9tJU1
         kelkFWE+qj9MeYmtwvS6cHQaqDlgptJrKAhoYueqL656VbszkQAdqZdawJx8cPXh9ziR
         y2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        fh=lBF8D8hAkCzvW6kdbLXp4VRwQ6t2AtxrOP3RaCjWeJA=;
        b=pC/ZH7ehesyIu8K85OwHwvuX0b6TxTQIYGHx/Mep6EJmEEtGQx0GG1E7hbPShOA5Cv
         uFrJllvYp4/RX8j1pelX/c2WjCQhKZXWtYlHlpQmIhKaxFocnfDYltp1Y3cNK0WdwfQU
         J2iXCe+JRbhIN3A6um34aiVhHT97CHEvxT3LxkgQ3PmOcs3sDAAsdzdrhZe5DXViHhfN
         kqtytgrvd5AkKkaU65S8i9xFWL37eCwxjsauu1CtmuOYEff2bqB+jk4wtjai8CITAlea
         u0rkNMoJNUbuC5HW4uvyLkVlxId9GIzwYaqQVNjOjZTD5VzQprdr9oUjkxmWD9HIgbb4
         94Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085858; x=1787690658; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        b=M4M2eyDSkYR4SYCXnqBys9j811r624Y2Vx/zlve6UX6xJM2KcL/Rp0kGHqHMMpoZS3
         /ODSwSJOSLDiQfwPcTAHy/aCb8zfL9KQZNpPta2nDMlDAIKpkNx+HeWu2qY5x4/GwttL
         CyoC/nvES/ziUnznBSpkOipdOlD2xUBwHIkd/UZ9YNoZLztk8NSW6MHnidUkBunmryXV
         +oDVen2czAmIXkL3DtcCdlYprleCpmPxF8TFo8XAjMHzzhxMiWiTPXns/VGs/hTJMY+B
         7sRSkur3HqF+jr3HRh2jUjW/KbRBlZiv5tjjwHnxa37d61dWQy0nJOxXLIVA1sxrXMHZ
         JvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085858; x=1787690658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        b=mHmofCxrUnJkNfmAhE0N4xqd6y5M6lmjxTZswbdeOMNJVIAC6XZS5mQbyy9uIWbKdt
         FjoQNmOF1MHikmNE43tusGbguAa+vTKOP4+A4pfg7FOyrl6BrCaaZPWHP2sXdlmjMIo2
         AjvmDPuk0UEBwy0aeeejoSmswxOcULF3p0qYtAJiynfJ4fAev4IivJX0bfOU/6lQTU7z
         krmvM0o/yVZc2FLhFIsX/riMzPLyXg7s8e6o+vxHq1wjjU9Vw2OWZcMnEH7a/PtS9a/s
         VNYKNvy0SuVkZgTU4tORc40GcWYCTWaoKY16gYA+uppvYHn5YqGvjPSJmvCht7GiOLRn
         Ajtw==
X-Forwarded-Encrypted: i=1; AHgh+RoeJM9ElAI/6EhNjlP2dvfV89I3gmab1wa48gGJbXE8k7Hr/6L1I9cFri9kBfjDDOVFL0c8Jqp6AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUp4h7+Xni55XRdvuOHxShxqhBW8GkSY5V9dIQhhxxDeo9UJLh
	wyA6+o08uABm8AuhvagUnXjE8ukJZU+Uk8heRY1VS0usGCeZP3jOgNNHRYboDdSbb7dTwKTxD41
	RJ5VAcC0Ud+N8C3nynrlGksw/S1xG4H4=
X-Gm-Gg: AR+sD102QsVfpfLYrgHOdmwGRf4m13gYEEvcKI4ZC5a65Jk5qbViFmgPtFhbxPsL4Uq
	vjjXAalC84g7IQDL5MeVKLpjYHzpQsWyQVF7dGr0+AM/Id2aVca8s1NV5gBjTt8fXqOeIL3cxCM
	FalqmfGAfD+LPaTMvB8UHeuVxOdWLbWBJG0qR8CkGFhh3pbyrogTPDO0kQwguf+yi0jako/3hXg
	+/lGVG8R2v72s79Tg1k3VR53/FBdGfxTSeYUgE2IoVQv8ijzgr1fFIgecyTP7ZByvhpCqJ3152N
	7+L9fkO6VLXLxwB1FAwrFwXlROjmdGuh96Chh6eKEqH9qXHaX77CUB2Q51Hy8CQcvq9u3sxTggJ
	4w77FcmKI+1RNbTUpQiEYrVLOsoeh7oA5MLfjN5MY+Fsfwf2H8y3eejYTF94qOGIdSnVWfi0Kzy
	Q7UtU1AQY=
X-Received: by 2002:a17:902:f64c:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d5f6c048bamr4365605ad.4.1787085857837; Tue, 18 Aug 2026
 13:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818152324.587932-1-ynorov@nvidia.com>
In-Reply-To: <20260818152324.587932-1-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 22:44:05 +0200
X-Gm-Features: AcwNN1XULaAA1GXIK7uBimPVbF7p5caYY_9Jijf1I6x_dsAVvxaRtE4L1JXqhyk
Message-ID: <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:23=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Make every Rust KUnit test suite require the Kconfig option that controls
> it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
> attribute.

If we are sure we always want at least one `cfg` guarding them, then
yeah, this makes sense (we could ask to write the `cfg` bit inside,
for "greppability", and for clarity / less ambiguity later on).

David: are there cases on KUnit where you would recommend/prefer
something different?

For instance, I could imagine a Rust `mod` for testing purposes
already gated by a `cfg` that is meant to contain many tests, and then
different suites inside that for control (possibly with extra `cfg`s,
but maybe none too for some).

Cheers,
Miguel

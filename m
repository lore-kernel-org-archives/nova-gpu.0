Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2338E8B6
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 07:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076628; cv=pass; b=Dn8RkWV8JMnI+dcXPX5x6MMQ5GDMEg5JwNIO2mnFvqWWpT65aBGbaaMhTwRlvW77uXhQs4Y3poxOu2LCI2tl79Hf6JithB8KojOmUk6UEGqn+fdefM15kF5DrHAicyNuD0NdEZke+O2kmS9bfH3XduCVqzi1GD/VIv63FHEX4s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076628; c=relaxed/simple;
	bh=1u2BFa1iUX+XKaaA6ooa9MVnK/6+bpSB45oSuaa4+9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwgAI3r7JE1qz2kArMLHCIAYI1CUxJsyPq5gudO0ebvL5Ji9S5DmdFvtDDPi5sluqGJoSVdCxuPZNTPj/6YZLPUiLwmUcE3OVsFBiFs4DCnDJpsK/HMzw0ILGnTaGkpMM08MbHmEHdqjJ1wFSUI3deWpbtOHxKitgACn4fQWOG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADZ/yHnQ; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADZ/yHnQ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304da3b4508so670605eec.2
        for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 00:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781076625; cv=none;
        d=google.com; s=arc-20240605;
        b=H0n/a6WyC+xhswFrFI72Uknw//NIRdScio5LoL6Yi86+s2m4AtLbgnbQRhCHRtj4v7
         fhH1YKBgJr8rZG9pHFRLqVuOG1OvZdUIDE55SoRFkGm/UvOwZYBWRunvxAVspIhnlA3j
         R3xrCkKZcatYMQy+SiR8dVL2yJ6kLRr3zTe9YdsrYZiNd/V96iwq5m4ScNlLQz7Ls804
         hqW1EE1LnwIJBZBjH5G8eslI0pHRSSHDP6aSRPSrDYClLYKnOhDFl3L5F2fL65RxH5MQ
         Js2mnwTA+FZr/jSHV9Q0Qk+zoqTN90O/M/Mr5vHA/3WIu1+fpmWPX31t2X5XiFvTQKP+
         adAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        fh=iMmcdDjxUtfRwM61JpZ4AY0Ndo3xaDfeGW8NfsJm64s=;
        b=bRfRgBiA4Qk8PkdttxL7yS48DcZgPKoLCsxdDxGT0VgCKyjYvO1CeV2RSvv56HE6JU
         gGZazh3FBvnnsN5Tvu+1/eRuSEXiGkstg5ffXyR/PusvJz+qTMkLzeozfIZrNwhf856h
         +0zXvjwQ1/5R/otvD4f1/eWN0H8l8AumZKP5VsB3OdN5A8p3FzEna5ZNO1MlYdhpsGvQ
         SxaxOhN/DU9NgsV2bOOxRUhS11aN85rUQsu8trK3REXVF9a1gshdJAYik1W1roDArujy
         MCSLUm61y3JXAPVWOaF/Tu6j7A9gzvJebRArqEgw4TRfaR878xTdepzcof1M/rgrbhyR
         31hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781076625; x=1781681425; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        b=ADZ/yHnQD3a99vBDY1csKD2smsZOXagLQzol2nDitH8mdBTPWLlbRJnei+QMmaoAex
         mMR1x6d8SJNOkwSi4xT2lQz4A7Ol2FCUPM9y7ihDp4ZYDhbC3j9FkP3a7bvfGM2LNxs/
         SFKZxOvQTBeKl6j7Q/8/OnnvwpTBE6IqM0T4s7iRBTPK+qJGCU4VNkXBr0LQzjmU3I1a
         +rQl7UGVGl1jTz/goxCRDmupaktonRG7c3Jmwkoa1n4Wya01Q/qLrcBtgu8VFFuvkfWV
         Gmn++mUBI56Sa1VEGLg8QVzZsZS70bk/0MLGgW8WbaAQZvwqIQ/Qg7JrL8qSs1onZMib
         +Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781076625; x=1781681425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        b=Kd5YyGlaspPJ7WFlCfdb5G2OROWoJS8BH2+kYJSgfCtPhztyPlWAnA12Jsi/oTNGpB
         zSeeqMTqNSrVZGHc7Z6uSVslbm3Vs4iTwF612dFioztwqcv4QU9aT0GlkzxsTlcJNs1K
         0hjalRSX+CGoafBU88PH3UFxb2qg04IK0VWSYjEyBA/YOCYV4f4fh0OE9yIMmfTQw1to
         PW7m3WNDOLdcjmlUDM6LJ+x0y8G3MdlKOY0E1jGZQoFiC+QcSBd5lywWffL6HpZ1LmpV
         CndILd7PhO6PVyGYDTQc3beCx4vD478XmAxPxPof0wOHHXnr4xMfB/I8HvfRd7p97oEC
         uCsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kcVOKgMXlH+TET8IDrHOotMC2YyfMYDVHgHSEs+VSsMRqPGyXvXGfm1T1JQny2O9CGI7VRJcOEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaLiIRNIOr8KBwcGr6vA3Lx2HUTNenGglH3Hg/yju5d8bSUHm4
	057CD8OHT9Wz1FY8Xem3BFv/u15cBlghfBX9xOGWVsYHsc9eWthnlgGpodZiPZhA8LJ3051JG4J
	Y0kUibJrpSouRCOl9W2Q0ULMljW1lDVY=
X-Gm-Gg: Acq92OFXnpO0v+sTAozHjzMoVvam5fFIWUPDgcSOPruXc5QaoC4cUpLcL6aGoR0ZJ50
	R5pc7fU5ucqGxTV1Jg5kI35nM5/PDSVPSrxgOgd4ubGCqWLyYAZSqhwUoFj1rXidDVM95GWlApr
	YX1sZXFVX0vwObTZD8kfu5Kmon4h7cDQ01J8Rsz8Wf8T1QgJyF2bcIXLvx66OX4UX0dyWf/yQsj
	ZAxuoSOp9nDgBu2omonNErEwXoYCzMvKR1+CGYm/QSUBwGmoAOqcHebGoXE2hv3r9VJk0Cj64Nk
	T30sLs3S0BXvJ95xKRM0ApfvOX6weBNoKIzHaay9YAYZSbptPJWzPtV+PpzhQIQ5CWnTwlH2ALE
	XqYMp7m60HhTfeV27uHq4WBaxHgrztQ5DBQ==
X-Received: by 2002:a05:7300:bc0c:b0:304:8860:74dd with SMTP id
 5a478bee46e88-3077b57ff09mr6067698eec.8.1781076620726; Wed, 10 Jun 2026
 00:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609142637.373347-1-gary@kernel.org>
In-Reply-To: <20260609142637.373347-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 09:30:07 +0200
X-Gm-Features: AVVi8CfhtUOUWqMJb81Bw-Ep_qKBuU8iXg5G_qpR2vrQ4E2KJJ25x_mDHtH0Smg
Message-ID: <CANiq72=H_box4dE2aFWcENE-UY9_1cAKMWzhxLUS_a=zHsFKrQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Tamir Duberstein <tamird@kernel.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Given the macro scoping rules, all macros are rendered twice, in the
> module and in the top-level of kernel crate.
>
> Add `#[doc(no_inline)]` to the prelude so it just shows up as re-export.
> Add `#[doc(hidden)]` to the macro definition and `#[doc(inline)]` to the
> re-export inside `build_assert` module so the top-level items are hidden.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Acked-by: Boqun Feng <boqun@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Sadly, because the definition is hidden, `rustdoc` decides to not lis=
t
      them as re-exports in the `prelude` page anymore, even if we refer to
      the not-actually-hidden item.

        - Miguel ]

    [ Kept a single declaration in the prelude, and reworded since they
      already had `no_inline`. Removed other imports from `predefine` since
      we now use the prelude. - Miguel ]

Cheers,
Miguel

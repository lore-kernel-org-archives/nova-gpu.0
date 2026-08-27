Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73FF429825
	for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823169; cv=none; b=gwYWZUKfG3yPG+GfPlcEYCl2jLv4p2r+/QMMeqrUNtFxz5NJe0qoIxxfpzbT/me0M0NLmsxwqyJ1oD0C6tsOBPaWqfvp63sOO+weLczvV9Aw5b7IOG8RwpXTzpwotz3+JMs+kZMnv8JQfBWxon7Kf7SufxrlQcX+lsmCJHgk748=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823169; c=relaxed/simple;
	bh=FN4dXpCMRANBXlU7RQqsFXeCvaEgNoe7ceT6uG7LLRg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s2dhXkWJZENSWxxwqKjVE0JAVweLpOCvLFSPON9d0Q3gWi/yzN3zY1OneQhAKQDWSceTfCcYn5mqAfyVg+vryAtg4mNF5CaLzI6lJEEMST46fu/fY/kjZRq/SpsmuslefMHHfJflwoYpGf493eI6pmuF5m1ZSoClAGEt8aDo6tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a7xYixY4; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a7xYixY4"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482a2d55c4eso989342f8f.3
        for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787823151; x=1788427951; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOVo/FTydc/3lTq5xwei4nbCv9MVREwBkwBRQhpC8zc=;
        b=a7xYixY4wd3EnshIXzKqGdtROhPIZajqNi9AYSId1HJImVnoiV6OpJzu/qAvgvxtVb
         QOLI0mBS85qn0VkXf/dem1FT8rV4aljE5fCNHqifd2mzdAm/dLDyzPTS+cfYUbgne6rr
         NBJTKnLg6+B7FmNAx+sLMinBla07jphEuRc2BnICNAvWkJJZc8AaLIct8swtkDrFNL9C
         lVPR1r9kHKu1gkR1n8wjZh03EnAIl67Ifa8dtU7cZ612rp++ap1+kqCozrvSEEnYeq33
         y2oxzZiBYNFHzADs6RXmgtDjjqt3dtt+4BVd9m0Nea+78HPNZBLMKjlBcbqUJvbFstOn
         mbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823151; x=1788427951;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOVo/FTydc/3lTq5xwei4nbCv9MVREwBkwBRQhpC8zc=;
        b=anF2hralPj/jg+hA/BUvw1xsmrc8Rn0SZup+n0EyfB3AfsgTThPfhhihlEGl7BTQxY
         cfkhEBRTAchqsvEndRuZczOVYJGXb0O2UuFJIWwEyb6owJF6D8z4LlI/V3sKhPozGFv0
         sdGWEzh2gKHIgT8wowwfgGyREneMdOnseI/1CxXIuqxD0wFPzfqXtZ5xMk3/jvri7lSv
         A4kAL1RYMxBdQe3D5NHFXwBRAZTJYJEFq3ANoAqXcRHUhy4uIY3RX/jbUWWOB7hJCNt1
         zFrEMWwMzvIig4gYE/pLvZUdKMG18s66ienGc0ChhEWh53oMTAc2EVbfizCT6d4zg9t3
         +1yA==
X-Forwarded-Encrypted: i=1; AHgh+RpfMeidxaNKHXao7+3s3T8D7bcnaSa1YZggAwYB5/cwjoZBt1QIRE5hiVw0NkTScSr/EvoIaFTdMg==@lists.linux.dev
X-Gm-Message-State: AFuF++lrXIo32cpQYCHEJqArvVmvnDngKdI2xW0S22ToFydJRxsSb0K2
	rXLP3RAU/09D6I70shQKJjw4wLB76JXvTpUi34Kcd0YM5ZHQa95P6sv0/ejGA41yh6HdQDrHcEO
	tuYQQixm+hTUjA/vweg==
X-Received: from wrck21.prod.google.com ([2002:a5d:5255:0:b0:47f:6d55:abcd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41fd:b0:47f:95e8:2ebf with SMTP id ffacd0b85a97d-482e26f8466mr17865060f8f.12.1787823150366;
 Thu, 27 Aug 2026 02:32:30 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:32:27 +0000
In-Reply-To: <20260827-chid-v8-3-bc74c77d0214@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260827-chid-v8-0-bc74c77d0214@nvidia.com> <20260827-chid-v8-3-bc74c77d0214@nvidia.com>
Message-ID: <apAEK9CUZICDTL1i@google.com>
Subject: Re: [PATCH v8 03/12] rust: num: add cv! macro to create values from
 constant expressions
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 27, 2026 at 04:28:31PM +0900, Eliot Courtney wrote:
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> function `FromConst::from_const`. The trait is implemented by NonZero,
> Bounded, and Alignment and lets values of each be constructed from
> constants without a verbose turbofish syntax. For example,
> `const { NonZero::new(1).unwrap() }` can be written as `cv!(1)`.
> 
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

This doesn't work in const context, so I don't think this is a great
strategy.

I would want to use it for cases like this:

drivers/android/binder/netlink.rs
        const BINDER_CMD_REPORT: u8 = kernel::uapi::BINDER_CMD_REPORT as u8;
        const BINDER_A_REPORT_ERROR: c_int = kernel::uapi::BINDER_A_REPORT_ERROR as c_int;
        const BINDER_A_REPORT_CONTEXT: c_int = kernel::uapi::BINDER_A_REPORT_CONTEXT as c_int;
        const BINDER_A_REPORT_FROM_PID: c_int = kernel::uapi::BINDER_A_REPORT_FROM_PID as c_int;
        const BINDER_A_REPORT_FROM_TID: c_int = kernel::uapi::BINDER_A_REPORT_FROM_TID as c_int;
        const BINDER_A_REPORT_TO_PID: c_int = kernel::uapi::BINDER_A_REPORT_TO_PID as c_int;
        const BINDER_A_REPORT_TO_TID: c_int = kernel::uapi::BINDER_A_REPORT_TO_TID as c_int;
        const BINDER_A_REPORT_IS_REPLY: c_int = kernel::uapi::BINDER_A_REPORT_IS_REPLY as c_int;
        const BINDER_A_REPORT_FLAGS: c_int = kernel::uapi::BINDER_A_REPORT_FLAGS as c_int;
        const BINDER_A_REPORT_CODE: c_int = kernel::uapi::BINDER_A_REPORT_CODE as c_int;
        const BINDER_A_REPORT_DATA_SIZE: c_int = kernel::uapi::BINDER_A_REPORT_DATA_SIZE as c_int;

Alice

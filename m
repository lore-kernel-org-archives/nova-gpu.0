Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B176A3BBFBA
	for <nova-gpu@lists.linux.dev>; Mon,  3 Aug 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748208; cv=none; b=QBsBIpxF6rTkNWT6AmYffKjxwNerC8ovhLZvKYV63JXU1RDmzt8cz5dMNl6FHfsUS4Yi/H4yzTQQrAslr17nyqg6/OUOa7xlckUMUQ9TB+hOuQ9H5tAw+cKZL79lQhbkYApRZt5lQXxeudikSsRau9k7+QKt9CM91cdDnTJIbaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748208; c=relaxed/simple;
	bh=y6lUUJwNmJwWDTpMLkBp1YAtLV9LN/nEevAEE/TK01Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8q8ZE5G/edEvBVs95yGCV7TKOBgu7Qqc4v0capB8fU2Bb2dBl/yoiwOHUkYXU02E/7Dy24Qr4/piDU9abRL16efRVRtSulh/5R8DNKLY8cHq6LklYYtmUi5qh3MRX23zySXQRZQ3Drbg2/uVHCv3HxPrL8NivJ67qYNq7rBUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZNM2ESMI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZNM2ESMI"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1598112f8f.2
        for <nova-gpu@lists.linux.dev>; Mon, 03 Aug 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785748205; x=1786353005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GNJHA/wk3B/tLgEj5BiBlQSmADQEGBijFgHvx9KdQ=;
        b=ZNM2ESMIzkalPgTJF4v6IjGLdk4Y5ERfTfUPvdcAXNb7vRSkwqYlmLrp5n0sEDjrJt
         xIxgYTFnwLsgZqVKlfFR/kyKUBOfmGJqocuqbMpwvC0MHYZhJ8POunTlCuc+eV7I8Bnh
         t078djGBBpf4Vq8uf6/mciV4OVAmcKUwZhppzBv+CAQSFO+1fVpEqWObS7JGK9UoA9o2
         5Zr+uEPuCiFAExCbTo93kpIX2Co7IWkdcLfCh1h39BRIIr1w36MVAnKE9cgK1jbCXusQ
         W2NC+7s30Q4Kw4O7s8Wup2THRKa+21u2Wgf1zaXodTCgHoRaMiAr1C6OnM6+QaPD97yY
         kFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748205; x=1786353005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GNJHA/wk3B/tLgEj5BiBlQSmADQEGBijFgHvx9KdQ=;
        b=PGKttM7opv6leZFf+wlXAVh3y2i5k5qHhbipQ6LLDnSHPHS3WxXMcVTFMdzxd/kXIM
         sIsSX/NOWPlJVVZ6ApaMxW3lj3+qmUNTG60eMbNGjPZVz/dEqF29uOfJtiL2MEUgMbHs
         Ry2KKrBsY7I8tyv0U0DCtf5CXS5bK7WA7vFS+kXefCJIlmTr0RakK+wJwtgPNOEDg7DW
         rrWvCTlhyGlDygA6g4YsclLCvm50pCSkUJwJkLFBJctfNg8tTnCUUpvno8AJo5Eq07tu
         7EiJDh/bopzXniIbEuHbcdlVeDYcXUih2BxLOgHJ6jcX+304r4bN7FIwo2SUYPfrSWjD
         1RHA==
X-Forwarded-Encrypted: i=1; AHgh+RqnBQagIkANnyMxzhkjRv4Wr8fgoN8ttA+oD5rGM9TmALXo89CtK5PYYC5M6kqXe4VHbaJIlRZK7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYyzH2hWgNiEob7JBBI14R2wJ8gnIS/7ajAMcrv1E3nWPLWiQE
	Y59X7ZsLOjzYQtsM+e+T8bdKGzf4KK2suEsr7IE0svb8PujLdFeWsNkye/x+Ig58vow=
X-Gm-Gg: AR+sD127uBdQ48kfb4wMjmJkuuoO/7j41XUD08isRJ1bD9QV9oVndYEAlsUEBuez5HJ
	VGL+NkWjtkDXRVuHyhXCgv6I9ybgUHpj+DFs253I0DEcScLzxpfsmYQmb98Euuu770AQr7kUhpz
	yBAKYV9/vqBbcl9lbIsp+ua3ycQsNvq/hl1GzZHsCvC8pqnwO+PHJUrkiqVTEOjsqSrTu1bqMB/
	jPGVC7cqRF6xZW7bqCTn2U1CHFYZ2B2ES+FJVDT4ZeHifl1ADhird9tSMv9MTkEvuEQ4kCpIShf
	P7U5TlOLkPnHZ088ODydzbN0lWKhff50FLq9JXhcK41yDfws/wF0f7Jtmxkn/fNGTO+KEd04PZl
	mLsvmmMsY7dL9b0SOidA7s7HgLD8AwFsPPEBrUDs8oxFEmjbwNRdyaxqDQZD+Ne04ZtYJT5JWnK
	gJMzsVNpJs6ENluCaYfZLOnU4uMNMqturPpDCs7l7kyBjPi/gwha4Gjw9s0aL8dnoo27xbhEZHd
	SzZyPSwvE4dKQgfpT18prtxWQgb5D8anz1p5UV5oe38yYNMLEDbwRWJwVQo2pjMAldLuL2/HxSu
	YpUK0O55TJb8L4fPH2JCXxe1APlg9Ow=
X-Received: by 2002:a5d:46c1:0:b0:47f:8b9e:f457 with SMTP id ffacd0b85a97d-47fd72b0552mr16078486f8f.17.1785748204889;
        Mon, 03 Aug 2026 02:10:04 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6cbsm28027816f8f.23.2026.08.03.02.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:10:04 -0700 (PDT)
Message-ID: <e8733203-29e9-4a3f-b41c-198dcf1d5273@suse.com>
Date: Mon, 3 Aug 2026 11:10:02 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc
 abstractions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann
 <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>,
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
 <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
 <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/31/26 8:29 AM, Miguel Ojeda wrote:
> On Tue, Jul 28, 2026 at 10:39 AM Alvin Sun <alvin.sun@linux.dev> wrote:
>>
>> Back in v3, Gary suggested this series go via the rust tree.
>> Would you be happy with that, or would you prefer a different
>> path? If so, is there anything else needed from my side?
> 
> That is fine with me, but let's see what the modules maintainers think...
> 
> Luis, Petr, Daniel, Sami: what would you like to do? This touches your
> entry, so it would be nice to know what your thoughts are /
> Acked-by's.
Looks good to me. I've replied with Acked-bys for the relevant patches.

-- 
Thanks,
Petr

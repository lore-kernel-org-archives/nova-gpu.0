Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886C3CF02E
	for <nova-gpu@lists.linux.dev>; Thu,  7 May 2026 12:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158262; cv=none; b=sPa0ljwm97vCZfA4ZvwwYURmzY49wCztp153TXpVpVW3tSeOzpqNk0zI6r6rFWLllwh1dHvTIhJKIwpdx2RZ3N7w3ZT5jNQXt+2vNW1GygMk14uxma2kCeTNoYbH3YldJkuivb/9NktUXvYjd1GUr85gFnNZaBCqNSWfTpcNO2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158262; c=relaxed/simple;
	bh=h3Vlkbk5sdnGg13yM94cBpckZTupKbTqjZZ6gANaolw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BwwqLGE03Pfe0BXOFT761bBZnMcXSoOWriEVAy+gRihFTCqgt+8GMeyJ+refAOlnFbbvbe3FRRGif76jcinxtFRDZuAQ6f2SCO6uhOqlMgZmtTNjSHQsdtSJx9BnDea/nXtsCgRzsLfl0HhFuR3Ct1PXUXh0nKLXXmAevrtMS0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h7WBMB17; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h7WBMB17"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48a5952c635so8304025e9.2
        for <nova-gpu@lists.linux.dev>; Thu, 07 May 2026 05:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778158256; x=1778763056; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8srcPUz2iRMxUgzpDjJPZ915RsxNlRqzvXbEly4DTQ=;
        b=h7WBMB17bwvjjC6S5qtTrB2xLInyRv/j6NbIakHN0xZcMUpuRDYgIKTo9u/1R3TBMC
         Xa4PHfhzj/dMJu5wUplGmPvFOefQ9AniUGhXlDMAQY9c6r2n2koBCRFWhb97PbAc/int
         V/gTstmPlNMfoj4TQsL9OCRhQ41tTms6LjEBRpmZ5AOFJlyTB8aPW9wR2730R3XO8OHC
         LHW2QO4HPYcsxG7I4DAvJm4w6fp5dztNwVduEjEHheWFSMA/bZefutwHqJng+5X0vzFs
         f73G+xWEl4llvXHwqO7Xb8FioVBIZCz1uGzc/VisbRszfhXdtEA8c0p03oYA2FU6uxSa
         GdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158256; x=1778763056;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8srcPUz2iRMxUgzpDjJPZ915RsxNlRqzvXbEly4DTQ=;
        b=Jk8lV/0geVWkV5U4eC7P6SGZrJoPce8Y+MwtP92YVr5sOoWYAWQTExXe8rV0crXhQW
         8CJKBZKMYVkU1noRKhr6o13nsIzpYHpfLeyo8qULCErPvAvqwagNp0B+8SYX0+m1g9Sv
         z8J0LM0emz/48ZK4eO52XTKVeuAKsAM+IoxkIiUVQEtYb71I8ZFgNSaR8NdX3jWbzzX9
         iKQ/Mkplf1Yt2casPyWP0XmAl6ZYrYtYdodW456FhGCAtyx0LD0dLSour0u7awT1KJCt
         wr5aoS7v9nJcDLBIOJpN45UvCzqt5TKU3LUaDRFmp9ImaWi3s1KlCbgvGa1TGW2qKQur
         ewPA==
X-Forwarded-Encrypted: i=1; AFNElJ9iogx1xhPPF/AaZnzolhkXnTH7ZLM0hHe2i5UQKd5yXybpKFdNAQsospybZ7BwbLBp8mPOzifFjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbaqp0NfnmBuwbaKp83zgJM3n7DhCcgP+9aLw6DAK9ZWHc/Gf7
	oKNIlYwOWHMkchq4z5pJ88L1rEj0Lrg7Ny/lv+VfgoNHVG5Kl5F1UrVh5kov4b0HqOILwxYBVzK
	EgG/td31TXYrrgQo7vA==
X-Received: from wrpu17.prod.google.com ([2002:adf:f891:0:b0:43d:70b2:d297])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f18:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48e51e19668mr127556795e9.8.1778158255465;
 Thu, 07 May 2026 05:50:55 -0700 (PDT)
Date: Thu, 7 May 2026 12:50:51 +0000
In-Reply-To: <20260506215113.851360-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260506215113.851360-1-dakr@kernel.org> <20260506215113.851360-4-dakr@kernel.org>
Message-ID: <afyKqwxDxu3cT7U9@google.com>
Subject: Re: [PATCH v2 03/25] rust: device: generalize drvdata methods over ForLt
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	viresh.kumar@linaro.org, m.wilczynski@samsung.com, ukleinek@kernel.org, 
	bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
	robin.murphy@arm.com, markus.probst@posteo.de, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 06, 2026 at 11:50:39PM +0200, Danilo Krummrich wrote:
> -    /// The type of the driver's device private data.
> -    type DriverData;
> +    /// The [`ForLt`](trait@ForLt) encoding of the driver's device private data type.
> +    type DriverData: ForLt;

Associated types support ForLt natively.

    type DriverData<'bound>;

Alice

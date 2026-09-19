Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C96547041
	for <nova-gpu@lists.linux.dev>; Sat, 19 Sep 2026 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853188; cv=pass; b=F8ZeWBZTANplnWo4IAbl8cK6YohN+GeW6ZnBswItBoEhaiHJYADNj3yjGVAxCUC147O7nR89FDfXyQ3mglRzx9CwHzOmWN1fhHG6yZW49+yIYyyDPfYAjaretwdMJSjKF/5j3eyx6bxgZwwtW5SA06eLUthjVViFvmn94A2C17w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853188; c=relaxed/simple;
	bh=W82cP2eM7LOKZLRzXX4bEVLA8ivt1Vz2Z6PZnWSs15Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJX/3jMgF519+Aza5TK3Ekc8rhuAzyrOzjxB4n24mUrNunVcPyQh4FYSX5D6HaUg1MbpySRA7I1+BMo9KFeNtrGXYZ9w0bgvKv5N8E9vaecB7Iq6QclyQDAQSGk+Z9FtrKEjxdxBHIFnk0uOv46xBu4Hz0eSzIe4rLa4Ga05DwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF/5Furb; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF/5Furb"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bef17c191so45531085a.2
        for <nova-gpu@lists.linux.dev>; Sat, 19 Sep 2026 14:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789853186; cv=none;
        d=google.com; s=arc-20260327;
        b=J/6LggT1ZvBG1Ycry4GLTkGx8zstqjHnsFoQHKXqNq0BlHNg9wa2EpQrvJgqoiBTVs
         qORBmHgyDYLGH6CcKZkSJAQAVI3JmHUenTi/fZGfC13XxG/cKjTkVc1FXy/2fsD4xH91
         iAEVhFAMfuFXI7iba+6BaAH03PKHXJGLGo3WgIkwWmBcBbgsC9cr8mACfKXicWqkxcAJ
         +6MznTFe9QqIl3fffotFTzZLX/bN6m6t1jOMluE4JIN/wM7a5mcVNsfqCujDrfxA0lRb
         KI5bILERUelwpWngZ2dvQnAlgFI/mlEs1yUoucaUeL2k8aqz5wy1qitmba7gMsQFFR7q
         2szA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W82cP2eM7LOKZLRzXX4bEVLA8ivt1Vz2Z6PZnWSs15Q=;
        fh=rBH9T3JKUT61/BLSiMclOdxapal0Sn/x8rFvm4fbIDY=;
        b=Sgds5yJh4vn0IdAbgUu5dggeVUEv3hoLH6oaiI9pDWxKiRXlqsM41zda8RVil0q4EO
         EIMtM6mubsmbiYQmcPiq5bJeYiF+eHJh96p7uuOsibny/hW5JFsZhwueJ9nWjBuKzDg3
         34ByvEaIKJZYH4mYlB3swXUnCZEa4o/gxvcKTIWqszjlLtyvnOwDnzA/gsewGaLNXtKq
         ZabSm91mvyxhDyO0u/CJgxR+YBTgaSyVJo3h9TmtzKhKz+YNTyxhXmcIZLdUYPrlL63M
         fFeTJByjzF95fIlJzTU41A49xYGSkOq6j1gBPjv2dyK4BJmRCFweo5ekVH+uYuvM99jG
         EGvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853186; x=1790457986; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W82cP2eM7LOKZLRzXX4bEVLA8ivt1Vz2Z6PZnWSs15Q=;
        b=EF/5Furb2krEAtrXok3ltnhbcVQtyo7TOYKqaBrVZSePT9yZe2fiZl4CkreQTg5eKC
         jRxvHH706l1MdTKRcXB984pz+sVgRWE9dTAv7cEnDljxBIlqG1jhEUN8Zghbi7PU1kWP
         oZ8D3sA8ky22g6zruqN46ZOZRat6VLmz8Uj7jcE/BcuYo67de8wQi873iEJXwOjj5q5Y
         tJY/5/wnxamSxsOQL4C30mKdk23a3AEMXFkP/mub3aXvQdSn381gtUf9psZMKTrWHZ5r
         XH/9hpRizhXii0zvnN0vR9Trg/GC6TsH7Bjaz85FRcEH0THHYPAZNpIym+WJDzamIFfU
         JuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853186; x=1790457986;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W82cP2eM7LOKZLRzXX4bEVLA8ivt1Vz2Z6PZnWSs15Q=;
        b=c+Trqk47vDhxGmXt1LNZouhZa28Ov5jGbYbSDiq0TdJ9CEgod3YJ6aa2lHMCc6n042
         6F2Gt6DGcdlpuYZ7qH3ioELJnbA1tyV4M1jBwDDminNetn+SIolOzVcGKD66r85vKnux
         obWPpR8vLr3H+W6UTo1VdkN7MrY/wLWPeUBPQHrhh42I/ow8QGtu99Zs2My7Uo2HB2LA
         lBaE+u1zzZ+iKf69F9g5uzxlToyzpyn9zxDJgE2SiDP65dW3FgR66Fpm8kBjml4hRrxn
         EHfzHMzyO2waSiboXEQYrDDfKaTUqLqnvmIlqcoFjqAY7pbytNjykpgyKnOMptJXhJ9X
         GvUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsCSsz8HKPq0+e8mSq8kbGiWVO3IJ9+qyf3g5C/YxPZlvUwju0WQNQN/+/bviO91+6M2/xiHjCZw==@lists.linux.dev
X-Gm-Message-State: AFuF++mlKokm0CW2/wlc2gjye4//8PqEymVBGfHftJ/3bq34f4gHtD8I
	1AMyBt7n8XyWoVUeA12D009xGXcMVD6P+FBwQueJJixYp8RYv0j0mBuK/cZuzuxqM0ihwDLMUkf
	92oDK3X/G8ngwEsDzQhKxNIBXincQyDQ=
X-Gm-Gg: AYBFou3l60l+M46JQvCEBOzRgEdPNpTrkgmNcL/rQbcVOhBg8Y9Q6+yZpLmj8Xviatv
	Fj89TViVT3RnX4+7tGoEFkvqPqYhr4hTP8nJAFCGq2pOMQ3qL1N9Iax2zqGLgDxuFXfp0RSmFZv
	Dh6xOeK9I1uVJjpU7dyPFgwCpiLnqljwXS2sG9UX1vYsSj8oxp7p7qwgfW7E4vfDiA8r1zrBK7t
	2Ge7igXok2x3X8H4hR4qExY3mFjAVip9lqC2kpF6wB4X7EJeR8zbliTCXkXvXY9B+5rF6sIhv+z
	Hop20xLDt6hxEyi4qxS20ODbvKHNNvXC3wMoLclcjEEpT6aWza5FZhIRnoIWjZTw0EvojEgXYNa
	9rx3I4t2pzsQOSNiDCDNYKcUSgzCytcAQQi9y2+ujwvS9gb/tFK4=
X-Received: by 2002:a05:620a:1d03:b0:939:6df7:73f0 with SMTP id
 af79cd13be357-93bf5761513mr301041185a.50.1789853185944; Sat, 19 Sep 2026
 14:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
 <20260909-mmrebase-v1-15-8dd5d4225d2e@nvidia.com> <CAPM=9tweFRWWjCrkBKvR03BaRVs=N+-qw2ju0g-dgMj+S7Q=ZA@mail.gmail.com>
 <DLJDV72PBGVA.1M0RZ780ZPJR0@nvidia.com> <165ab493-9de9-43bb-a53b-3fa82f8013cf@nvidia.com>
In-Reply-To: <165ab493-9de9-43bb-a53b-3fa82f8013cf@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 20 Sep 2026 07:26:13 +1000
X-Gm-Features: AcwNN1UIoSlXyTA_I5dOxTH1mKYz8_NXz8Pq7spnjuOWiDNpvrhOSQYr0h3NdB0
Message-ID: <CAPM=9tzFaYp6=3nJ3yxEhjaHzUOnyQT0eV884eKR7ma2sHp73w@mail.gmail.com>
Subject: Re: [PATCH 15/16] gpu: nova-core: mm: Add BAR1 user interface
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 06:13, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 9/19/26 8:03 AM, Alexandre Courbot wrote:
> > On Fri Sep 18, 2026 at 12:38 PM JST, Dave Airlie wrote:
> >> On Wed, 9 Sept 2026 at 14:25, Eliot Courtney <ecourtney@nvidia.com> wrote:
> >>>
> >>> From: Joel Fernandes <joelagnelf@nvidia.com>
> >>>
> >>> Add the BAR1 user interface for CPU access to GPU virtual memory through
> >>> the BAR1 aperture.
> >>>
> >>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >>> [ecourtney: map BAR1 in NovaCore, borrow it in Gpu and BarUser, no Devres]
> >>> [ecourtney: update for the VramAddress raw API and gsp_resources chipset]
> >>> [ecourtney: drop the owned GpuMm, pass it mutably through map and release]
> >>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> >>> ---
> >>
> >> BAR 1 and 2 need to be optionally detected and used. At least on SPARK
> >> there is only BAR0.
> >>
> >> I've been playing with John's branch on spark and had to rework this
> >> code to make BAR 1 optional.
> >
> > Thanks Dave - indeed we also hit an issue on a device where the FB
> > console was enabled (?), which preventing BAR1 from being used.
> >
>
> That's different: another device driver was using the GPU. People
> should Kconfig their system to avoid having two device drivers
> trying to claim the same hardware.

At some point nova-core needs to call the remove_conflicting interface
to make sure we kick off the overlapping drivers properly.

>
> Once Nova get a bit further along, it will be a non-issue too,
> because Nova can drive either an fbdev, or whatever the modern
> alternative to that is.
>
>
> > I know Eliot has a bunch of follow-ups in the pipe, Eliot can we make
> > sure to dynamically detect and enable BAR1?

Also I'm asking for this now as it it might be easier to make that
sort of design decision earlier, rather than trying to revisit it
later.

Dave.

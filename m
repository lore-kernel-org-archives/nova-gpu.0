Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD817DFFA;
	Thu,  1 Oct 2026 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863793; cv=none; b=LX9dit1/POznINpAr8aPxZo6gv8/ziBM78Nv6BhivFfIZUjPgBM2sZETFotHc8Nq3wykoNMZ/4ROgKb3zplTl6R4oCLJPxgZz8KrOnJYPoqWYVV+O42L3F72hTaUPYCHFdzx8pw55Vd94O2vsUCJxI89GGjv+0MQMNtLDzMH9Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863793; c=relaxed/simple;
	bh=M5Ar3MoX3fWOuP+elqUMf7O1tby+6SpIqvoH7bo0HMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDuFSZz6F5Wq6U9bnA4bkXivIZtAh7yGgOM82A7N8wButIDgIahPnqYP7wn+r5kPygLN9QGQg7Umr+tlEDx/fTr3d7wtBxRUR1sFvu6nh8gMPJbppUCvkuXnXj4KGd83KXzHHOpBOox8WMYkNjJWJvkzvL5Pxko7DoaHb1lVJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doC5wVT6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doC5wVT6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB0F1F000FF;
	Thu,  1 Oct 2026 14:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790863791;
	bh=M5Ar3MoX3fWOuP+elqUMf7O1tby+6SpIqvoH7bo0HMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=doC5wVT63GSkFR9Qbp4OZgjya72TueUHOtJecMiNyL2vZERUlywj6Uf2yQFPms2SA
	 BhFiWLeWewoAwI7TaShiVnDpbsd1rykILkXjhWUMV92vILTbatVHYmQB9EHSgzdphN
	 tpN19uVy20y7dZv65ecELz8f5tUT30brmQvh2sOQHafuKajfZz7m57Yu23Lt2I6h/K
	 ajCfbg8lfWM6sEJTueHjAqV19Z30pXqKXaZEhW9gqTdOIil/ExEZFTG7CD78UAFh6T
	 8K8zi9wrogUz/z2dHXS7UvbbMpQQjOuRfn/v1DH846YKk2b+2tPxzQH2k7MTWM5Dsr
	 NckNtcwTP9lQg==
Message-ID: <98de7db9-31a4-4a47-b363-cde395263c87@kernel.org>
Date: Thu, 1 Oct 2026 16:09:45 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] nova-core: GPU interrupt support and GSP event
 delivery
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/26 5:41 AM, John Hubbard wrote:
> This series adds GPU interrupt support to nova-core, so that GSP events
> reach the driver as interrupts instead of only when the driver polls.
> v5 applies Alex's review of v4, and makes three of the design changes
> that he had set aside for after the merge. The series is 15 patches,
> down from 17. The two rust/ patches are unchanged.
With patch 7 and 8 adjusted accordingly,

Acked-by: Danilo Krummrich <dakr@kernel.org>

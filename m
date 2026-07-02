Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF3352003
	for <nova-gpu@lists.linux.dev>; Thu,  2 Jul 2026 04:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782966935; cv=none; b=phYBmv3bSzgIPZIA5oD8JoNpj/dhzH/EfnT71b3Vjbco8mzRMZOB8T6vroLjaf0Sdw3jcHaMB69A4oimZaFqCumXMQRe8VsLCewUkXxbJ8TUpGXgFz4gemKQNla9hlaCR8QESYVtV2laIPKoDUmOCXcInne0HBopvWMRWTN53+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782966935; c=relaxed/simple;
	bh=iVwmGLa6f1uDnXVXjo/8Aoy4NOH+YwZf7Zd+O+Dtkgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8m8mhfJFSS1XAWqlkwpWiZntUmtk+GJTKUnJ9ksZHwZPilOCGhCktpShVps4A3uBEphfPPkjQTvP2F5h+jplIFYIocNQHIpjSwvW+7gE7DulzQ4RnPBNQLI5Isb/MapR+TkhMm6/pXCt97y1zNH1xp4C51xUkHQ8j3heTNnXDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlFNzB7n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlFNzB7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83A21F000E9;
	Thu,  2 Jul 2026 04:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782966933;
	bh=qQ6AcPC+6tAtj4mR79LcDBehZQeOv0pwvXO06/ad9J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hlFNzB7nDQ4wPhvzbuKbP7GlttuU2+McLfPo+tBfpaAbDLr39y3b3z0mZaLOE1eN+
	 Xo2KpqTODQ1oEMKC6rNpXHgGCK6z9PsUpN5ZzJpQh6WBqWf1yxTen0hhagAsMl4KLh
	 EOYnlxm6yckhDLSgZkrC8A/X8eChraULH0VifJBljelorzVLYzY3/PH13GiGANpOGa
	 OqAMGqqGmOgt4xlD07tejTYPjOL2rtlWbwURWVcURymn+zPjDnGA2Z2Sh13RvVLR9n
	 NT+ShiFAoe5irKBTqEocdhZybA5kduIgLOLlfu9ZFsfvGjKOwuupoz5mDrJYebK/3W
	 DdaQZz6WuWtkw==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 054CDF4007E;
	Thu,  2 Jul 2026 00:35:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 02 Jul 2026 00:35:32 -0400
X-ME-Sender: <xms:k-pFatVPHD-wfdcSt5DDIq0s1NHyp_qvyNMB7Cnk_mAIFVN99cSmmA>
    <xme:k-pFanQ-sHo2pzbTosB-CFoipUa6MDm1Mo5fd3bLkilkXUlzuJoHlIWY6oJ_7OlAf
    _HkIch71sdhk7R_vNUGv1UjDNUH-NabtwC2tMUfAweW3CUybftI>
X-ME-Received: <xmr:k-pFaosQeL-3gUkbDkM8DPrL66eOsQLai29P1S0YNMxBPx_fmkLJi506iGiMHSCphMEaJ9muXD3M0p_XwWBFpaXMw2bkylnL>
X-ME-Proxy-Cause: dmFkZTGOWROfQ5BeBPMP1RytPcByPAeRGYXaRj56CjJShjBvVAial8V+/PhS9tKRf9j4Ua
    XZcHmtCjilWnt9dRtPHRHfnBfoErbVRWDu6Z6yvc6r9FWcVn80Zqq/aEldJ98LYAK9xv4T
    PAy07CxqyOcIe953y1bCgmlQP8fIX8Ckiib7dYq50y7uL+thRqbjSqENvf0nMGGlZMnE/D
    ARY8TqA7CA75MgyK3o+hv72aa89IkKbCBOdG8ohGu4REqrLaNC2ODUlNduW41yh/gbu9TA
    Ey+UgG9Pfo6TRFJPTPet4cA8Y89vISFu50HAW82CkBUBzokLysd358b/TKxbZ0Eluhv3b2
    dmNzxENhqsuBg6lrPSMoCv+wNdjTxXsb2L7kg3NLEfArWJVpZHfy4p09f+XDjEi9GjJymd
    gMJMdEM+zDF5bp7qgHB4NkEMcKZIKDo9VH1z9ng+qKsjhsyZeEQzeginJsm0oCLGO5RsV8
    usyj9TY+fHLmM94EJCxWRRud/n3u+jMQHRFHRMm8IqYUKgYQqanOmQd2lVtgruUsC1Om6o
    dMzpADLMJMe9I/YmRD2bFzN+t89L836nIp2/CSHVwXnudd33/3j+m44k5rFdbn4vdFTB/M
    j0jBoan9AqnJVUWxoXUwzcBszVsEfsT161gh74B9/VLDpww8pvVfN/2QXoRQ
X-ME-Proxy: <xmx:k-pFaoYLIT92EgYrSPsjR4GFqeWHIQLZ9F6gCvB8srd-AdWAZkwfAQ>
    <xmx:k-pFar-gvME-Shrg5pq5qLV9yM-vOcbbi_OPHCav_xDhLmiIevCGEg>
    <xmx:k-pFaqCvyWS_NQVvrkPPINpbxuja7jrpLRPtqhd6_r6xvj1zqqQebA>
    <xmx:k-pFanvk_OFE-DDi32qJw2OT5W-9aOrycyM6hPeCbcleNSVjk_8p3Q>
    <xmx:lOpFakbghDJU3owT6epJUFnsOhG_qLz8TSDD4hmq-L5Z81S_LXG-gFzT>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 00:35:31 -0400 (EDT)
Date: Wed, 1 Jul 2026 21:35:30 -0700
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,	rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,	nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org,	lkmm@lists.linux.dev,
 Eliot Courtney <ecourtney@nvidia.com>
Subject: Re: [PATCH v2 1/4] rust: sync: add helpers for mb, dma_mb and friends
Message-ID: <akXqkldA4NnODxAC@MacBook-0RXW5>
References: <20260609-rust-barrier-v2-0-30fcc48e1cd0@garyguo.net>
 <20260609-rust-barrier-v2-1-30fcc48e1cd0@garyguo.net>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-rust-barrier-v2-1-30fcc48e1cd0@garyguo.net>

On Tue, Jun 09, 2026 at 04:38:37PM +0100, Gary Guo wrote:
> They supplement the existing smp_mb, smp_rmb and smp_wmb.
> 
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Queued in rust-sync, thanks!


Regards,
Boqun

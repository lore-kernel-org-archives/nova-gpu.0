Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622362;
	b=Iv/fleJulsiNNwytNdWHpIj1ro596Cgsk/yH0vfJ6iEagrgLpkn7hHNcbeQEA834jFBn
	 zJ5CvYwN+Ssu/jTnjMS7k/Nn7xEoxym3L3NSPvtQgbjIwCPbyWAnldYavA0TU/HGZ2sy/
	 A3gLoUMpUzU+eC29AtXMllJsJUCCmh6fO9bUtyznuMmuUdlXNW1Sp8JCzroV9GyHaj58z
	 vlFYCEsN/1lYpAXYVFr7hSSukIQe+iswQKmLkvFlO0UQt80136r0srTFH/Y/RlkBJqy2D
	 D8POOwXRIqen7V1pEQH/KhbBSfytOMBrS80jd8oo9MescXmTa9gM0+WEiCgQNrUvTaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622362;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=gzngZnWeVoBNyK0vM3pG68W1a+Vad3Q5z/6OD0OHXJ0=;
	b=PHlEOwmlsYB5KM+MWCDfd5HBd25BridmHB6DlPWBaTiGa4zTFoRRKRM8QGsxQVEJmN3c
	 o++VJChJkjtegNYrzBcU7pfEgbVnas9ushXqTw4riVpO9z2vQ0Tht0X1qrblrbTYZPyTv
	 g5sRTVHVH/fgu9c4ocTQNXTrNIXG8HN+D/hgahwGGSx5omQUnMvTyHQwbbp42NBwTZ5Y+
	 Lhr2cufFC8HJcN42058fbjkUrdSDj41j8PBmbqaKH9pMOCxxnNtCgR4k9ODbYG4hj1dO/
	 lXfs3JgkIse98mir46NqTlct/8e4mMT6Z227cwFPttBwmoQ0kW8Lcro9bbzLD15gBsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bI8w4cs2;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F9606A31E
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 15:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bI8w4cs2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795622361; x=1827158361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6UmMlg9QQaOS1il33yRRnEhhIt7G/Cm/OZEfblVd9Mg=;
  b=bI8w4cs2xwXOYx6+3S4eaHNiJlBFpe7edeQ9aDgjalVT6S4L/fOJrPRu
   A+f+w1B7bivnaVOMeZrle/C0s6HJTlr3JHwhFSOBNcfmJSGYwlo09Cyon
   PSiDTpuykLMzLoF+XvJ9l+Ei5Q4nBUAiwOpnVBIMfVklnSqM2QYo5FlrC
   zhptYWaZi/ZARwDnSjbhuZFhBYdH06ZgOZJMzPk8PFxvm/uaBbMxnoAji
   6ofxcZUmiS/CwdL/wprfXwECVGae5hU1boIkFe7EZj43or/x5lpTKSO5v
   Au4ibRydB8hlNzjuDdzfRFKdyq6UsnZnCgBy3/H8Nt7F0IpgjaU4KUdt8
   Q==;
X-CSE-ConnectionGUID: UIzN0GFITCqhwvyzX76HCg==
X-CSE-MsgGUID: ox1HkpGARMi3s24icn+TJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4563340"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4563340"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:41:49 -0800
X-CSE-ConnectionGUID: bLRALCkxRbmeWeMo+EtOZA==
X-CSE-MsgGUID: BsA3SM6yTjyQu96dFq5UXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13698968"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:41:47 -0800
Date: Wed, 25 Nov 2026 17:41:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: M Henning <mhenning@darkrefraction.com>
Cc: airlied@redhat.com, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	nova-gpu@lists.linux.dev
Subject: Re: [PATCH v3 1/2] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
Message-ID: <awcBt3KD-j1sOzhE@intel.com>
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
 <20261124-nova-nouveau-gsp-v3-1-e1440479ded6@redhat.com>
 <CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Tue, Nov 24, 2026 at 11:43:59PM -0500, M Henning wrote:
> On Tue, Nov 24, 2026 at 12:50 AM Dave Airlie via B4 Relay
> <devnull+airlied.redhat.com@kernel.org> wrote:
> > +config DRM_NOUVEAU_BIND_GSP
> > +       bool "Make nouveau the default driver for GSP-capable GPUs"
> > +       depends on DRM_NOUVEAU
> > +       default y
> > +       help
> > +         Make nouveau bind to all NVIDIA GPUs by default, as it always
> > +         has.
> > +
> > +         If another NVIDIA driver, such as nova-core, should claim the
> > +         GSP-capable (Turing and later) GPUs instead, say N here; nouveau
> > +         then leaves those GPUs alone and continues to bind to pre-Turing
> > +         GPUs itself. nouveau can also be prevented from binding to
> > +         GSP-capable GPUs at boot with nouveau.bind_gsp=0 on the kernel
> > +         command line.
> > +
> > +         If unsure, say Y.
> 
> Maybe the documentation should make this option sound a little
> scarier? Right now all this does is break nouveau (unless you're a
> nova developer),. We really don't want users or distros turning it on.

I doubt people actually read these descriptions with any real though,
if at all. My suggestion for an option that breaks existing setups is
to mark it BROKEN, or at the very least EXPERT.

-- 
Ville Syrjälä
Intel

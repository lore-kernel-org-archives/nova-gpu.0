Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1AF3B4E83
	for <nova-gpu@lists.linux.dev>; Fri, 21 Aug 2026 05:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288542; cv=fail; b=Ggj559S73k7azzi5nacmrMb0qxudj1akpTR5uc/zb6V9OYpDixD4v+M5JjHoDB+eaicXd2633REhmYW+vKzSOYcHtG/OxqNvkGZVWNGXMZirwcD3esJk9lveW6OEz3lQPAI7McsuyM1eUIKgy5x/w/f0dUrVOv8pu9bbeDL+0tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288542; c=relaxed/simple;
	bh=L7gcQLBHo9GIq+N7X16Gp4wOCFsSJsjhuRP8faJYgF8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNzBFGM7qYtkt6ISEBZ3spmuit2PJ7GnkrOBvqCojp/mD1szCf32EvYtmZKUuTUrENyySOvs9LXahHO4FfIs4MMqenqB/OHzYkDIQJPe5eYUU/1FTWYeWdVGajXGcE+2ZlKthN+qFjxw8fJmTbMJbkwE1XewrBFQTP9bPfT8Wxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KXGHIyw+; arc=fail smtp.client-ip=40.107.208.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KXGHIyw+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRhnpGTBpswI+dnVv1Hsr+O1oz9SbSCxA1Y1LkXDNGRQp2X5X/NQgS5IYR6A6V6fvYXYDE9OjAp1NidQUSw+apE1yjwwqvsJORIYl6acYONXKn+6w+OAO553GDgWmtbEYkeWjCUTvoRgVgH/tNwg/4jnK0c1IuFqPef0CKDRyWWVpa9CYewxncTfc4a1z8z8y/kubsbvCAn60l7P/BtlIy9woE6ZrfG1OnxcH1Y5/8s5HIc2SHs2zwMuT1Srfa+j3wMvMKzlFdGfXKV8jVYOpBO3lbk5KE2dHw9zRSMbPiNbraVaERn0f25OPlNTLUFT5ZzkeMh3TDXLAQ47tmAUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbQjqhQSBfvdPLYUYz9xvstqIZZIJUjViChhrJXDgv8=;
 b=BIwfabu6JyPSS9gTtSKbRSzOgNIESd5FJz+UvA1y+WjXjYg4cZFFNIAKDtW8jpJUU+JqJTFBXtH2pD0ssF9qW29Uv9HXKHto+Uj8BD3M8EoFPpoBTs/hO4OOYf6+aaABQ0uysyrqpyXbLxKd/7NBo6X+Nhg2RPbpjEI/udOCqaZMWMwvW4zIEJpkCbp4378H9bQtHj4zVmMeAa0KflesKFA+oAXPplrFstCVcy5udKWsxGOtA3Aji6JdryZ2NtkcnNsdzQcCyAvOe5bG6CWQAdVHxDviz65QoMvlar3UOSqnWy6M5Jqgqw5umuuEOgk6OOoBhq7uqK7gGD0ABoU4XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbQjqhQSBfvdPLYUYz9xvstqIZZIJUjViChhrJXDgv8=;
 b=KXGHIyw+bp5rrVYXyQcxXDy+yJr1cV6pIqwOXFRRwmpz4msyFLtQqf5LhRFgrdgZkVkiOCM8zSdfhwNsmmLATLUmjd0+CScjcVJSeG9sTMuCpMDzyEreCr8WRHGlIxLCXuOf1teh6+Vw/MbL4fWotX0LJJ8j4s4hgp/GlJ1dXwbWipvwRwvK6uFUo1wcIhxespFMhip+jETpxjXbRgodT516r2bY2YX0uaIHz2V/Wgi6aEQ1PuB9GDXaNCwWDulLkOOk+EuYnDFu06kOOvQoAGv0m8oj3w23qXOswaFT5oKCTdGNU4qKhDd6wQvhUJAUR+zqOT3wm6pFxt3mx+f3+Q==
Received: from BN0PR08CA0030.namprd08.prod.outlook.com (2603:10b6:408:142::9)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 05:02:15 +0000
Received: from BN5PEPF0004698D.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::11) by BN0PR08CA0030.outlook.office365.com
 (2603:10b6:408:142::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 05:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN5PEPF0004698D.mail.protection.outlook.com (10.167.245.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 05:02:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 22:02:00 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 20 Aug 2026 22:02:00 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 22:01:55 -0700
Date: Fri, 21 Aug 2026 08:01:53 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas
	<bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/27] gpu: nova-core: set MCTP transport header version
 to 1
Message-ID: <20260821080153.469c0655@inno-dell>
In-Reply-To: <256ff759-ac15-4058-a2ed-d54b8e8c098f@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-4-jhubbard@nvidia.com>
	<20260820123819.20bc6289@inno-dell>
	<256ff759-ac15-4058-a2ed-d54b8e8c098f@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698D:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 38269f42-3e17-4e85-3ea2-08deff415e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|22082099003|18002099003|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	hU5sC8+4Lzn/XSYHwBGrrza0iGgmtnAaw2BaQOjp4umN3fxCcgeqXjnv34tCNtBUEJOsTg6XJrofdvYzc/6/QgIRUs6ro9nNR+W+BUdamQ5zUd6YZ/SLUUh/cmIrlQvTTQQrln6Q+QDIvysJfRrlW/q8H+MRJ1F7XTMczmIYfYDFlHwipW0zjLfsIT0qZ7EGYQQJHshAJNRhJSa2vPL0V2XAqzsK9ziEbBDAEF/G+Kz+kPy1RmKqDpNp5xE39SN/iDxHIbNbHrNafNtZrI7x75NSi/IQKcj2WjtcRokECGLb5FR3IJ5IeWEFei4LEZcz10mdGBpnJbH+fO2s4GReDUcsnmFuIamvNAura48TEb1ZF0Te4uHFQ6tnJ5Ne722JW5qeIZPDwG+sbOBMaS3Co2YHgOZg89LXOjJYyxr+atBCH5FHS/VhpCXqHgffuoAlPrIUSW6D1Jp4po2lBZP11JUmTxoudUiqp18q/nZjOF660cR0/ypnEU2Tda4v1nbKCSJZaj302f4xMysulCGVHD/4Q6nv0vlskjfBWgz/7pbx24ai7fU3uP6E/tWRUYyuseTuh4h9N6B7f1M435ofy38xHVfM7zvjkVvDax53hRhGEX//EzRnJIrxbZyuaYBZtx58W/N60OMJZgcKAjaPyvjwSdlPTt3VZXYPOKkINm1NdfXxPVJXYUlzWOfPSoto8vQyhaTVhw+/XWoPeN4rsw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0Xz89TpANjJ7cemkSuqBi8Llny3CF2rsh75TP7/bLDoJ8B5ls3MawwiVu2YFwgAkP35H/Bp51w1OjWPnN4vutC2Zuz0ZPuLMBxAevVQjM8SvVHY008hCWW9NfvrvYrKFIhWyLIQbznAUpvQM8Xx1YgAIUvC5L3wfz3/qNPbQAYPIVvDpRmAePLhyKrv0wOHx7ADYMlCxzPhoc5ZKlhmd11/cDD5cW0PK2Nduut0MNaho7s3Nw2liptoSZZp53efQf8e6ebcHpsanV43/KspyYUCZfumSiNxXl7NNTAzyG5qZDGo7+H8aUtPQo5fdwRlQ9o0Iq2b3WB4nDV56AIVWvgdWxmwSQL2l7WCXS+G/Ym1u/XCBRnpCOiEoSq3V20LUVJp5drgeXLJAAw1g2fIC+aBWMQr4iuQongQEvLG4OQQLKAnNlL3VQYDob+IcJlCO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 05:02:15.0407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38269f42-3e17-4e85-3ea2-08deff415e3f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202

On Thu, 20 Aug 2026 19:31:33 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

No need to reply to each comment. :) Feel free to use whichever
feedback you find helpful. I am just glad I could help a bit.

Z.

> On 8/20/26 2:38 AM, Zhi Wang wrote:
> > On Tue, 18 Aug 2026 20:51:56 -0700
> > John Hubbard <jhubbard@nvidia.com> wrote:
> > 
> > One nit: might be better to update the doc as well.
> 
> Yes. Agreed. I'll send individual replies to the patch feedback
> as usual, but let me first mention that I've applied all of your 
> and Timur's feedback, 100%, to a -v2 branch already.
> 
> It's passing tests cleanly, so as soon as I make a few more passes
> through it I'll post that. Likely tomorrow.
> 
> thanks,
> John Hubbard
> 
> > 
> > Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> > 
> > diff --git a/Documentation/gpu/nova/core/fsp.rst
> > b/Documentation/gpu/nova/core/fsp.rst index
> > 52d618d22bb8..60c647181da0 100644 ---
> > a/Documentation/gpu/nova/core/fsp.rst +++
> > b/Documentation/gpu/nova/core/fsp.rst @@ -106,6 +106,8 @@ All FSP
> > messages share a common header format consisting of two 32-bit
> > words:
> >  - Bit 30: EOM (End of Message)
> >  - Bits 29:28: Packet sequence number
> >  - Bits 23:16: Source Endpoint ID
> > +- Bits 15:8: Destination Endpoint ID
> > +- Bits 3:0: MCTP header version (1)
> >  
> >  **NVDM header** (NVIDIA Vendor Defined Message):
> >  
> > 
> > 
> >> FSP requires MCTP transport header version 1. Nova-core leaves
> >> version bits 3:0 at zero, so every CoT and PRC request carries an
> >> invalid transport header.
> >>
> >> Define the version and destination endpoint ID fields. Set the
> >> version to 1 for single-packet requests, and leave the unused
> >> destination endpoint ID at zero.
> >>
> >> Assisted-by: Cursor:claude-opus-5
> >> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> >> ---
> >>  drivers/gpu/nova-core/mctp.rs | 14 ++++++++++++--
> >>  1 file changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/nova-core/mctp.rs
> >> b/drivers/gpu/nova-core/mctp.rs index 90c642c91a72..03546213da28
> >> 100644 --- a/drivers/gpu/nova-core/mctp.rs
> >> +++ b/drivers/gpu/nova-core/mctp.rs
> >> @@ -42,13 +42,23 @@ pub(crate) struct MctpHeader(u32) {
> >>          29:28 seq;
> >>          /// Source endpoint ID.
> >>          23:16 seid;
> >> +        /// Destination endpoint ID.
> >> +        15:8 deid;
> >> +        /// MCTP header version.
> >> +        3:0 version;
> >>      }
> >>  }
> >>  
> >>  impl MctpHeader {
> >> -    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`,
> >> `SEQ=0`, `SEID=0`).
> >> +    /// MCTP specification version 1.0.
> >> +    const VERSION: u32 = 1;
> >> +
> >> +    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`,
> >> `SEQ=0`, `SEID=0`, `VERSION=1`). pub(crate) fn single_packet() ->
> >> Self {
> >> -        Self::zeroed().with_som(true).with_eom(true)
> >> +        Self::zeroed()
> >> +            .with_const_version::<{ Self::VERSION }>()
> >> +            .with_som(true)
> >> +            .with_eom(true)
> >>      }
> >>  
> >>      /// Returns whether this is a complete single-packet message
> >> (`SOM=1` and `EOM=1`).
> > 
> 
> 
> 


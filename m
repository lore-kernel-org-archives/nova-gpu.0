Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012048.outbound.protection.outlook.com [40.107.209.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97243524B17
	for <nova-gpu@lists.linux.dev>; Thu, 17 Sep 2026 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651719; cv=fail; b=Lp45qCQ4koyjtdbogqOF7SKIs6+u7O/gzVsonWw6V/FOx6F7CA2Q4w7sF5P6wNAFg/iISQxWTxXy3C9xK0WtoKKEs+XEXxOPMRW1p14yEdObIM1e12q6a27Jv/wC/kMU+mPXhHI237o+O4idgjCYwnJHJuJ+aZkYrqUHarh7IoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651719; c=relaxed/simple;
	bh=KuX598sFpmHAwE4Lv8RqFLJXliBzruMpV9nIouy6Mp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dfz9PNBwbbVTp/GqTcioN9S3JDJt7J9cBDxMZanlzm4L+M6vg82OFoDcQVHJxYNwupduJu28Bg+uWoq9I1er7sVROEtqiBJl1aqIRDbyAwG8nIoVtpF5XnhXoOg5PsT3NLJkhgBtTNCpd8TTM0i4Gh8gxuIl+Tp5RhXby9tKTqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bv5OZQJj; arc=fail smtp.client-ip=40.107.209.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bv5OZQJj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5G6ag3Gau7c5LrAlAFVuqXYNGsm96L4VFKr04hz4BP6It4L3Jxvn4SqDvMa2o0wyt0ead/YF3/sL9j5PD2zkpmQZDLjm/x0asB6WARg6WMhKu5S3Yo3WqhL4rtSG4VXqqUMi+JEg0pu7NSKm6thbBWoVDLLK9ysiFYfHcANTSbO806SDBtnat4rf5jueY7YIE0yMchAX2Vl2tqtuLPrLNsQcopPDk0+F+Fx7IiMwPaVkt/RwJCq/obUDmGHMRwhSNaOLeMKHbeSu/gt79bGcLjXooZSQYNLqT1NCFxBuYaO8cFsdqeybIgXRSPkTAPFUYa19O2bk9QpONXoP3odlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USSaLadD5HZV0myvONbZ4v65zu3rnNL4yD8l48T4zWE=;
 b=BTAvTf9lqJfWp4Njqz10d1OAb06ZxOG8agg++DI/jbPIr1cBJcVyZ/Fkw+KExrcwADk+p+v3mMsEsaFYUyrAaRkjhnYoCiindfcGIeHRlAaA/4BW0aJnxunkwg6XOJ9jq4jAX4urUUsjQN0n0pBRHc1IKj0lqp8zmneTMRi44P1TUQqGNAy5p3ISCpZT6Gp28/N05BO5kMT8lbVPPOX6vB339fYtlWS3TVS0F+58sGh65QP2ZH3p6Wy0DGv+OHS+SzV8NE+WgXShtBhFODxMStvx9TQpUgBjsiPoFaHgx5iLyH6o2K+yz6fmEUflLK2hlMhQcmgodpRcZc1wGkp0LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USSaLadD5HZV0myvONbZ4v65zu3rnNL4yD8l48T4zWE=;
 b=Bv5OZQJjm1yhvvoWo+hVZlLOFfNttViYI96uocqaihF7UnXIGa8fTUClA/Zz1VLoJO+Z8Mm1BiLe/xjf1JGheoxmOWluDTUxUtJRSBHIUvvKjQWBevmXbNsCyU6GMGFgISiO67gVfLYinzSl+t1UbxJriveoy5ciJ5pC7ecjvI1d0tpb1v6Msp4A79Q8fdw4f0BXuxpR3sHn+6YUALC6MPQgi+/NB3aHWvuQfujWSIbyyaUBKM2bpA+UeVUZ7WrfpC0Vv/7/mRQHltubgBGfdjVQi0oysXKXXWRIEwQhHyreFtfISgN/ohEmKxyjPe9VGdJquEKs6nsUeQNfKNVSWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by PH8PR12MB6819.namprd12.prod.outlook.com
 (2603:10b6:510:1ca::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 13:28:33 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 13:28:33 +0000
Date: Thu, 17 Sep 2026 10:28:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>,
	acourbot@nvidia.com, yishaih@nvidia.com, skolothumtho@nvidia.com,
	kevin.tian@intel.com, airlied@gmail.com, simona@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	jhubbard@nvidia.com, ecourtney@nvidia.com, cjia@nvidia.com,
	smitra@nvidia.com, kjaju@nvidia.com, alkumar@nvidia.com,
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
	targupta@nvidia.com, nova-gpu@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhiwang@kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 12/13] vfio/nvidia-vgpu: add the NVIDIA vGPU VFIO variant
 driver
Message-ID: <20260917132829.GA3968357@nvidia.com>
References: <20260905081116.106613-13-zhiw@nvidia.com>
 <DLCRZLO06SIO.LS7TWQXIPZSQ@kernel.org>
 <20260914121217.70fa0d93@shazbot.org>
 <DLFD2ZDSK9YQ.3A4R66G8UJMD8@kernel.org>
 <20260915120148.7548a8ca@shazbot.org>
 <DLG7C7MLGSTC.2GSTD84WI595N@kernel.org>
 <20260916141718.GU3968357@nvidia.com>
 <DLGUPX9KPFKF.12CU304YAST79@kernel.org>
 <20260916162817.GW3968357@nvidia.com>
 <DLGXS4SCP3VT.28XXX09BL963U@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLGXS4SCP3VT.28XXX09BL963U@kernel.org>
X-ClientProxiedBy: CP3P284CA0050.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6d::25) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|PH8PR12MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b1aa42-289a-4ad4-c308-08df14bf924b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	12eB4ZCbevc2X2qN2YjH807CS14diBXrhqly8S+ZkrqB+40aVqSi/Ic3cGxYuJPXjTLzasvto4SDuh009xzh0RROey81Nj+iQx85R5p/U0uH6nxUK/IwNec4ZHqhpP4uWZAhJjnOGTMoX8RPiMs0UBXfet1Xqvk6Tv2WnQjFePj66jBwVnxqXovPRoH8WBxnEbC5GiX1JG84QC6e4lsouQ25J5xw0n68hQ224Q2JJJ3DiYfF1AqBb288DcZ3Ly0HQoeXjuV2LN4o1kgCRtuDkXdkUCtupop0dz4038GzFZDbUCL+j4L/XcfzJcb47oGyHo5PZ9Px0OScwVOo4LIAHHzgQLDDmJgCYhCC82oh60qgdCVNFW5aRh/HEbJcIPyYWiGvXCNz/4uRnpn2lbyRYgiVS44UOvYpbyD7l/Hp7XhEpvvT8LgCpRQp6uGIovdE7NgWtzYfUQrHBox+8iRC7aDwkQhlpSVJdQDAP3gX7lqgsdYEDai/H6ORAT0BHDJGwEVFiDvmIPoTe+QfgljOcf8RxE4PE07cWex2XW981RQba4S8nySPbvu6cI1yDGF+b/qIgV5NN/hkcXM3aadgMobLbDAfV71rznmlY50bHkQrjq0jEhoA4Bg5vBeI8gWs7yqF21A16NSIgDpulXlzgrDckLBKEBdOfgwuT+v8kgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1STGUL9KRoQ/h/b3Wc9BCN+3ZikqqPJpBe5jVWg8Tfo8tUOabQ5y+bAdxFU8?=
 =?us-ascii?Q?RWlo+3lPLaY723Cm2rTPwjaRbdmewuzpYonwPMyvPh3iHXaiisf0U4li+dw/?=
 =?us-ascii?Q?QfLNO8PCpQ0v91bNOjTvlxbJghJzP+TtthD72CsUPusAOKWX2inqUAflhuZX?=
 =?us-ascii?Q?obV/yZT81yUtj0C60oeIEeD2cgiYNSemhg0nurkQL4iTCwAJeJzHnk/EdDkx?=
 =?us-ascii?Q?H3ze8E+BTJUpMe58DwRshEVI/AcJTIzRs3V5K4g9q6Wj8eQz9Cu7M+mKT/nR?=
 =?us-ascii?Q?I613Yz1vvEc82Tcz70wcXpxqId3zyV/pLKToON3KNKnHTqmo9579P4anTDgn?=
 =?us-ascii?Q?17QGyon9U8FmZMYRJpCmSREJQnAHrRgL0H0KhkNWeOJoHRLlvzu8vSUQmbKJ?=
 =?us-ascii?Q?NfpYVPIqBAi7e5QUzp8UvgdNb793+PxtDN2WF9gPDbMZBW/lP7Ow5J2Y6HXN?=
 =?us-ascii?Q?4bW2MLHes7g++0/epHELSiTbsw3HaRi0uLWkRkzDs64WtKGKfvRnMEDJxtWY?=
 =?us-ascii?Q?7jHPgmMfK7D+5On3w9APx5FdjjafuU3q/MGE29S+lbG59C5v++Ksi8mWp/b/?=
 =?us-ascii?Q?WAer+cggIw/LLlaryOMOobmYg3R5iZF/gRHoCUhZazRnbA5CaImR27fQnwbo?=
 =?us-ascii?Q?UozHsIKXRqtQ10fkJZJ5yB33SicQ468r1h5NSEXoUcr/RXb5AwRm4s63f3R2?=
 =?us-ascii?Q?pnepOYAs8UuDxR7dF975h8ppWsb4opIC8gcT7jZzKYwaAAKMwpdUUUGDCzUn?=
 =?us-ascii?Q?W3gpD4UQ9x8OPbl4bSvSH40qmtCG+sT9SZF0RHzd4axIdWLjPEJOgFxipW24?=
 =?us-ascii?Q?c/SyMuGg0SxqpmnoV86Ghp39JHqZufxTJZWif+dvOMkjlNKiVpAqjTE9/dRm?=
 =?us-ascii?Q?w0ATRhSjOPyBvzYIBTKFAfLxyrssTUQxpVIt+f2FuViHb+v1Xr08Vj/kOnXr?=
 =?us-ascii?Q?9HIeL5qYCAFI/V9WUdJa9VsV2X0SW5nYiP48OjTi1rJtifaaMpoinOTfouly?=
 =?us-ascii?Q?07nDG4/8DFTQCu6Cxfm4p1XItDIvdNntkWZqtMSxICrG7uRo+largZ6CL8Uv?=
 =?us-ascii?Q?dKd/p5/c/Bsyie4OP4zBG+ZwUQv3TBoh+AfiGfHSD57ls+Zu20NVJUYcDn4E?=
 =?us-ascii?Q?DMQnjdL5R07sl8jfa1QDBSezVjeYhKO7QabMX/qIHs0fqmarddKAEa8mHbyj?=
 =?us-ascii?Q?vsmogvVOTFJpFwmh8W4LyQCmosZFed4k3uwtKOB+5Tqs3R9yW1GWSmXrtATQ?=
 =?us-ascii?Q?Ojdna+E9bebIcok1t+w/t7lUJ7bKeFE0jUTwkdumERFOyxWx68FFHaqnULcl?=
 =?us-ascii?Q?Ql/reIJjVl9IrO7iB+L7qEQ6Y80mEstbzgj+30ij9seTo9xGCTCPCV0+c6jJ?=
 =?us-ascii?Q?ZqZUg3SZRSk2sK+JQa9cZUDbTT5RcmKRjDZC5bqJO6lcyEdwmzPT6vH8Olil?=
 =?us-ascii?Q?2/bMI7V/JxieuzKd2WOqOIapJutiWDbH1OEeXGmsTwL+VC9FdM9+NFLniQ6/?=
 =?us-ascii?Q?s8LKkAF6ZzrYdHCVC2N/yz5ZkSWnpbUKbA0QKSJW+os1W12CZ3HKoUrW3bvL?=
 =?us-ascii?Q?X83NXkszzuqcwDyx+GflAviX4YafdsGBI1fc6iUeT2pCWMnAIc95hEKeJLrz?=
 =?us-ascii?Q?czpH4QnOK6VLWGUA8q/lNf9yi/hSX5c3sdTA6U5YDCkP/jqRtZmwiWmJPv1p?=
 =?us-ascii?Q?xIUL/IhiIOiq3MaDcgJ02NOAIW4UexFr3mrNx5kAnh3Wdcqq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b1aa42-289a-4ad4-c308-08df14bf924b
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 13:28:33.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbDnTTE3ApTRKSBC0vxGOA4590Yv2mVxUjnhjehskAejwYx+GeZQufTqUeG5qSc9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6819

On Wed, Sep 16, 2026 at 08:02:17PM +0200, Danilo Krummrich wrote:
> >> TBH, I don't think it makes a difference; having Rust abstractions is pretty
> >> much the same as having another driver. I.e. it would be equivalent to saying
> >> "before we accept another pci-vfio driver we need to do some rework".
> >
> > Well, it is, but thats the point when judging effort..
> 
> So it seems that we agree that there isn't really a difference between adding a
> new C or Rust driver in this regard.

To be clear I was trying to say I think you are are underestimating
how much work this is and how long it will take. Including all the
preconditon C reworks has to be included when considering how much
work is involved.

Why can't we just go forward with what Zhi already drafted? Do we
really need another side quest?

I cannot forsee rust bindings for vfio until sometime in 2027.

Jason

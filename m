Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A63BA24F
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702526; cv=fail; b=TbNbM8yoCAdVkRUZbEr8eJFZhebLwBVLZRw2zfHfY4Ob6rMgD50wOW4CNtXKyZL5/qZiHZsk6r5a0t8DocWPAJA8h8LKei+pzCIEf/gfNPiRDgeMzLhAxbC1r/90YBDWNSY0UVjujzgsmHs0IaFgdLOa5dU5Jn9FXTidin9qkP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702526; c=relaxed/simple;
	bh=NmSYE7+EuiEuRtpEr/4CAaRLQABmJCtu1KRA/Vds3Ic=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=gBTTgVw0ALtpkd85fToNXScwaYEy3RmOpn4N8oQYWsZ+BBQ1DGaxTRTW9Zs+KswjRWVCdvF+wcoRUNCWKY5J74E8bkNMlFrmxzZNCzUpZkPZCl4imdKqwVydE1lFx3yDEmmpzOwikE1TPQmQ2XFfnIOuJhQk/aajNv0VCvWce34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SGnvHyBI; arc=fail smtp.client-ip=40.93.196.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SGnvHyBI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdXwC4ngO6Z7v2K5QuDAv5Ihwx0ht+sopxlNQXUC3R6JWPW3MfF7bpLk6mmV4stYw8LMr0t/AdzvvUUTxyvx+HTwHnXQRmbtjTLsCNZo63by3uX9DvNdVojMIIbQ1gO8cdCexEnGuu8SuQ7RUgF2Cp46m0pMBrnNvk2KlxAX/Axab32x0TVZuOu+LUdcp0WN97Df8x/niwWRrI9WcbjBX8Yueq+ZA4kv7rKtoulXcOIpERSDyxPMxCXGzOmqRMsrFtC173e+UEA8yR4ru57Oh4FCt3pjkUws6DIZStaSGirU/AjKCSJGTatB56uloyg+jnsAS2exRQSoNfLRbIVZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD3GsiQY7Kl96aVjg/MsFbEnlvblcVrl5+cHTlIQ9hs=;
 b=hjJSQUflj2WiP9a0Q+mgtlOJjUQDD7ggUIfOFMDv3a9tpO0fVRnzqzOSvDsa7NYQy7j4YEK2FkSlbQtizme1kWSp4mkQOp7QRHyB67sn4zIUkyeh+nDDW1aIc+loQx8VuXHEbrtp2lAcyMeK16bMp0kUyu7NaiA4HdXGmH7DhMqwznXVfq48Rng4VytbAgtYWsNC6Tq9mRL5A7nMOslDP8cRTJeL31WbxGWX9bLJqJWHSIR6sqemnFuRMTV9lzCJdlSossQv18x2lJIthcDBMX0j8Ld3WAo20QF4vCwcbmdKnGSDEEFiigCvrlSVUVdOSOT+lR/BwONvI8da/U3QWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wD3GsiQY7Kl96aVjg/MsFbEnlvblcVrl5+cHTlIQ9hs=;
 b=SGnvHyBIxC8izXARxrw70B8Bos2q3kP5NVupqxfn46qvv4JuGKVv6MPWX8AFKY5PWkkSvyGo9Cs5MQmPV8glRntGoLrjZT1St+GDDl4YguX2n36uABplNhcjIWNciSi/nGlDF7rOLDQotCrbA0xN3QDLMrfyt8QQZBSixL7Lxgr37U4v+1kgKPaH6AeD0cwOQG3ne3cjqTKczTYAEMfLL+uQlWecibFtEs99M5+EdbsJM4F9CApuGZ3pxRQTdCWWUqqBqtMW/CE6U8EzVImU74onJBlysFEPREDjPANv5FDHIQ122+M8bpgsaZ2G+Rsn4zETXsvzSONcDOc4drKIWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6727.namprd12.prod.outlook.com (2603:10b6:806:256::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 13:21:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 13:21:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 22:21:54 +0900
Message-Id: <DJBCTVQR8E8X.2UA8MMTLJOP3G@nvidia.com>
Subject: Re: [PATCH 5/9] gpu: nova-core: add FSP and PRC protocol
 documentation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-6-zhiw@nvidia.com>
 <DJABQBFVXDZW.T9Z7B76WVMXL@nvidia.com> <20260617105106.5fceaf8a@inno-dell>
In-Reply-To: <20260617105106.5fceaf8a@inno-dell>
X-ClientProxiedBy: TY4PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ed8503-ca1b-4526-7574-08decc73689d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10070799003|7416014|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JF+eJlw4yR14pOQCLjWHBcWB8R3vUpPGMPn7wlLILFR8fBBAT4HEdoe9NhuASHPHyNQVHfa/tykRxVpGPDlVnFwQw4VwKCzOqvJyny1rqjRudKh+LJWzN/ANBAJC33oIVKTGrS4Nca45yR8IXOihVMVXz6MDPgthIELfnMSQEkGCo7w0BVxaHrDfg3mRAa+fAypr2vDUTB/OKu40I09V4/IZxDfg1zZ8THCFMORbc0tO8WL7meuJaMNGgiOjXee6heMhbEX3rZptMqqd2UQtkds0kJp+GX1d/TSmr+P7i70l6yLaW1BddSeser/VJ6OIO9mP473fGkyRd36LN1VX9pcpfMljNny+aBWjIiYrs3qnrxQYcwn6SCZve1atX5m3QqzhxGhPQ8NNFeaINsxg0BXF3aC4b6/pS1dp6xavV45KDt5EAriyKK0cFns25g8oNOeBF3Nik5JrOc2cz/OHQE/MoOevlaUNsybcX1nmWax2U12rkUEMN9rbEWMIKbt9GV66vfalfZviTcRzFV0j/GPI0m9SezThtQaSuGOD4DKOEwC7zrYb5c8QcqBG2Q4Us8DNsxwso7kcGk0zA93WHsNgoVVNZIRofGbRnidTDIx8tALs4VoBhfpU3ahKhaUPcL8h7BK7uGRCfg0adLujfXTtxYW5EmRYJRGrxXa6YQvD1d0rGezoI+rM3FMCSU7W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(7416014)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk4wdnNvWk1WNExtdGxKSXlaOVc5SzJSdWx0ZldIRnNFcTRnQ1hLMHNYczdi?=
 =?utf-8?B?ZUtUR3Q1b1FvaU1Eakt4OTI1RzZMRnNaU245QktKdSs1WW1QVHVuTnQxNUFD?=
 =?utf-8?B?REY0Z0xBNTdrS1QvVUZrTVV1Zk5GMFZjNThYS0xOU0VQREJWQzF4NjlRSWxa?=
 =?utf-8?B?bjZPMllIU0pSUzR4SXZRdGJtVmRlQ1c0bFBNUzM2M0lrSGIwWUswQnRtVlda?=
 =?utf-8?B?ZWpRMDhCL0hXWWhNdHJ1TFh3OVJWVkc5Q1RJeEhwSmJjT2k3S1gvaWlWWExN?=
 =?utf-8?B?eGtrRE13d0lQcys0VE8veVp0RWhBM2xZblhWc3k0dWtUODdNekR4QWdZZU1Z?=
 =?utf-8?B?YjhRYXFhSkVhVXQ2dHNZWjVkVzZLZU92S0lrQkNOSTR4MXBQczdGVFRleFQr?=
 =?utf-8?B?YkJFZ1JBVWVkSytIMmptNXUxRUNzdDhVMmFmTW9OaUhLQWN5OWVWVnE3eXgr?=
 =?utf-8?B?TU1wU0RyZU5uOUJtaW02VldCUG9zeTJhWHZtVkxxbjlRekx0U01DdXNzT3or?=
 =?utf-8?B?dDZlU3hpL0NtTVhSWGRNQWZKTjROd2lnd21ydnB1MHpxZjVXVEJzZDgwZEs4?=
 =?utf-8?B?eWNmVjVXS0ZvNlVIZDBhVXJncmZiRytGaHJSYnNxRG43STZaUXEvVm9IZW0z?=
 =?utf-8?B?MlFZWGtId3k3bGMyMTNjdzZQeElUZmZFNTB4QkZnbGlOSm51TnRGY05USjdx?=
 =?utf-8?B?cHdUYXdHbVAyVElqd3lhMmRPcmdBWW9xaDVMNnVEQWpsdTJ5Zmp4UDh2anBF?=
 =?utf-8?B?SHRhUFpPZzdrRUdWeC8xaUlFSGxrUjRkRkxyMlMyZHcrdmg1SzJVOE5VTnh1?=
 =?utf-8?B?ZG9zeGhibG9sNk9PbWxrWC84ZmtCZzgvSHVucDZaSC9lTHVwYkZLc0c5VlM0?=
 =?utf-8?B?a1lnM0VGSTRMSFMrN0V6QmJYd3lFcDNIeHoxQTAvTm9RS0drNk45TXJsT0dG?=
 =?utf-8?B?UUIvUXJMVDFWazdubGtwTVdNdlVZUXRid0JSYXZpa0ZiUDhiNXRLM0FwVnAv?=
 =?utf-8?B?RU9OQUlQY0xGWDBzOE5odTBNRWJ2bFNocU8waGRJaE9NTGw4TEVkWk9tc3R2?=
 =?utf-8?B?UGcvcXA2OWIwNXpRbWdRQkFvNXFmelp3bHdIVjZTZkdYWUl5S1o1RmNkMGdJ?=
 =?utf-8?B?cllYMU1XRGxsS2tOSjZuR01iaGFrMW44ZmltUWlTOW1hcTdEZ09sejhORW0v?=
 =?utf-8?B?N3hTVnllLzBBMCtiVzAycy90b2JWekVIUHB6OFlFTXNLRFgyWmJUQlE0MGl5?=
 =?utf-8?B?VzJRMTBkUkppSGMzK1NuaHFiVmx3dEl1K1VJYzkvQjltZEpRWXU2bHFzTjg1?=
 =?utf-8?B?SkhBRksvK2J6VVhvRDlaaktVNCt1TmNlenkvU29xWC9kaDYwQm4yV2tiajdy?=
 =?utf-8?B?cU9sQ29jQmxPOEkxbU1pa0l1Z1hqNFpTUXh2Wmx1OXk1RXVXMjdtWDZxMFh5?=
 =?utf-8?B?WFhxU2RsNG00MC9LM0JxS1lrcDlFZ0p0TG1MNkU1OHc4ZDlMVDRXOWM4ZDRN?=
 =?utf-8?B?SUl5M0hjVTJxWUZhUHlZb0lYQnExVVhXM1NEQ0QzKzRCL0cwMmZSUkdPbjRE?=
 =?utf-8?B?dnlUL0xxVkF5QXBXeGZzRFU3K2pJZ0Q0MjUyNXlUUGNReWNjZjRTYWp6Tk0z?=
 =?utf-8?B?bUNoTzZiekxaVmF0SkdxenRwZElmZ0hKVlZXbC9CQVp0bTYwNWZjNmR2bEdr?=
 =?utf-8?B?eWNHeUwyU2NoeEE0ZWVDWm1sZExkTW5iR05zS2hJMU42c3lDTWVNQjhGUEZj?=
 =?utf-8?B?YjFLWDNvekhibFZDOUlaR1ZYN1l0NFpIZ0dYcXNTaU5rL3RmNWVuazlDb1J4?=
 =?utf-8?B?T01weWlMTEM1YStBS1NZRWhNdXNDVUtjSTVtZkpGbVBtcWp6RGduSXRtbkhk?=
 =?utf-8?B?TlZweE5rNjVtMnN4TjUvUmRvbWJEZm44WTN0cjhJQXpiVnhOR3VqZjgzWFpP?=
 =?utf-8?B?ZmdmWWtWZnNNN1NkM2YzSlhmM0c1am1OVFprZGhCeFM1Vi9RRmR0NmxSOEEv?=
 =?utf-8?B?akxsUUJKdG81cmxNYjM1YTB5QWozV3cxeFg1Y3dVc3lSZ3ZUN2EwcXhqa0Jr?=
 =?utf-8?B?NUpDRXJoR0JXUm9hYWZOODMyV2tUcFJXbExHd1BWdlZFY0RaUkpCY3pZUVNt?=
 =?utf-8?B?cTNQdGxMc2IzTGxMQUU3aUpQT2Q2dHRpVWpCbURjMno2WHo0azJXS0gxR0pM?=
 =?utf-8?B?TkxxT29Dd3NMT0VNNTdjUEp6L1ZFL3ZkdHJacGxsbE1KWDRFdU1xMDJ4VHpv?=
 =?utf-8?B?ZkpGenhLY1JsZUhuU1BTZGExbFc4a0ZwYmhaV2lJVzRQUW01bDk2Z0lLbVVU?=
 =?utf-8?B?WVZFOXIzeFpkcUpmVnpiVGFkMWtlRGRYZy9NeHdDQVFYUnk3SlBoaW1pY1ZR?=
 =?utf-8?Q?yKnIuE2hRsosMLM/i02DSL69GXG3yAtUF5+lKduHbnj+B?=
X-MS-Exchange-AntiSpam-MessageData-1: 8Qasn9Ohk4t0gw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ed8503-ca1b-4526-7574-08decc73689d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 13:21:58.4206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGq0Ii0KIvauTZXO0y/lg+uIBsAO/i2cfQpOhYRjNSJwb9CqgHTGMvK4vPvORYfRAx8pwa1TMYZSKA9KkrK2OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6727

On Wed Jun 17, 2026 at 4:51 PM JST, Zhi Wang wrote:
> On Tue, 16 Jun 2026 17:17:34 +0900
> "Alexandre Courbot" <acourbot@nvidia.com> wrote:
>
>> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
>> > Add documentation for the Foundation Security Processor (FSP)
>> > interface covering the simplified Hopper/Blackwell boot flow, the
>> > Chain of Trust (COT) message protocol, the MCTP/NVDM message
>> > format, and the Product Reconfiguration Control (PRC) protocol used
>> > to query device configuration knobs such as vGPU mode.
>> >
>> > Signed-off-by: Zhi Wang <zhiw@nvidia.com> =20
>>=20
>> This is super useful, thanks! One question below:
>>=20
>> > ---
>> >  Documentation/gpu/nova/core/fsp.rst | 142
>> > ++++++++++++++++++++++++++++ Documentation/gpu/nova/index.rst    |
>> >  1 + 2 files changed, 143 insertions(+)
>> >  create mode 100644 Documentation/gpu/nova/core/fsp.rst
>> >
>> > diff --git a/Documentation/gpu/nova/core/fsp.rst
>> > b/Documentation/gpu/nova/core/fsp.rst new file mode 100644
>> > index 000000000000..52d618d22bb8
>> > --- /dev/null
>> > +++ b/Documentation/gpu/nova/core/fsp.rst
>> > @@ -0,0 +1,142 @@
>> > +.. SPDX-License-Identifier: GPL-2.0
>> > +
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> > +FSP (Foundation Security Processor) and Secure Boot
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> > +This document describes the role of the FSP in the GPU boot
>> > sequence on +Hopper and Blackwell GPUs, and how it differs from the
>> > earlier Ampere boot +flow. It also provides a brief overview of the
>> > PRC (Product Reconfiguration +Control) protocol used to query
>> > device configuration through FSP. As with +other documents in this
>> > directory, the information is subject to change and +is intended to
>> > help developers understand the corresponding kernel code. +
>> > +What is FSP?
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +The Foundation Security Processor (FSP) is the GPU's Internal Root
>> > of Trust +(IROT). It is a dedicated security processor that boots
>> > from immutable ROM +(Boot ROM) inside the GPU and is responsible
>> > for establishing the Chain of +Trust before any other firmware is
>> > allowed to run. +
>> > +FSP runs independently of the host CPU and starts executing as
>> > soon as the +GPU is powered on. By the time the nova-core driver is
>> > loaded, FSP has +already completed its own secure boot and is ready
>> > to accept commands from +the driver.
>> > +
>> > +Simplified boot flow (Hopper/Blackwell)
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +Starting with Hopper, the boot flow is significantly simplified
>> > compared to +earlier GPU generations like Ampere.
>> > +
>> > +On an **Ampere** GPU, the boot verification chain involves
>> > multiple Falcon +engines and multiple ucode stages (see falcon.rst
>> > for details):: +
>> > +     Hardware BROM (SEC2) =20
>>=20
>> Is this referring to FWSEC-FRTS? If so, should this be `GSP` instead
>> of `SEC2`?
>
> Hi Alex:
>
> This refers to the BootROM in the SEC2 Peregrine. From the timeline
> perspective, FWSEC-FRTS should be positioned as below. I was thinking to
> show the brief differences of relationship between internal processors
> so I omit the FWSEC-FRTS in the sequence. Do you think we should add it?
>
> +     Hardware BROM (SEC2)
>                     here  < ----- FWSEC-FRTS (GSP)
> +          -> HS Booter (SEC2)
> +               -> LS GSP-RM (GSP)

Ah, I understand now - the boot ROM that verifies the HS Booter. No,
what you wrote makes perfect sense, I just misunderstood.

Pushed as-is to drm-rust-next! Thanks for taking the time to put this
together.

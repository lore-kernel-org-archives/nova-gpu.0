Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011057.outbound.protection.outlook.com [40.107.208.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF78E3C9456
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 06:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985251; cv=fail; b=oXGd09GoERmgyoMqDTVXvUBPgSp+DIv7OD8e+SF3KM3nMS0u4TOcryTpSDIxFWfqzetQvfoIlClBmj2G62Xei8ogPaTVuibzJjBYGms6Qyl/WxT+uElWIepHrIdCHKWcSJotvYk8siX8VyN2eapD8WC0AYXMIScCWQxiU6W05lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985251; c=relaxed/simple;
	bh=yltCDjLnMlIEq4JhYkZ9oucvGiMjgHRnvn7jSo7Xdss=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=tDspG2BC6+VJZ5lo+QKO8kOvJlf/pILI4ydm/5omk2dFkpd4H2SMRwJB7Z4Yt/08F+G6AOBW0V4hnngy1TcCeKh1l7LruSYk7wOH5JaE1ybh9Zk/UWmY4tn6PFXBpIIy3qAVMGuiZdabUJEIPVOAmbUi13NpZN+H61l1FSM74bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cWu178dU; arc=fail smtp.client-ip=40.107.208.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cWu178dU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIyHnaRPNNNufDPiKFVQNX3FGNb5dAbwWLMT89QtDbntP3vJXVkXZRbqqJm/kchGnvdErIIPWeinn2KZieTofzs2zO/vtPLUEW9uo2a12R9LqyHgurEiutZ9wDezqmxkjpBdQLFVGS8fbhfmX3QniyFLw/m1jJqO8gKb5Tgqe4kG3kPLky8Hcxkfx3czITFc4mu2QqonLXwNe1WnSnvwkr/i1iDiOtIvFzGZTJjQurgd7WVQ4nJ6x3iwbWcw+wOV/BQ66eB3lppbaU/uqgcRyq+GBwP+tpjuIUnN/xqx1BYdZTWJEFyMTOUxEQ5TLuHn3j5OTHyuVZ+gcNlMYBkHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yltCDjLnMlIEq4JhYkZ9oucvGiMjgHRnvn7jSo7Xdss=;
 b=Fo7tQmQ42cf5iVSALmzUXM/YqwbnFUEdc6w0JG0bH2bcx45kyr071xUeCqXqIpruN9UYaxJ4kC0mt2q8hYKn4r4dd8GQ4DyYPgv71YnfmrGXefRhg+oVnAD+9WVYPZazWyugAm5NmrWfxJXz9sfvYCU9KTo0b0clySGkBbp8fndMzRm9DU3IPqt4x3I0d4JHFSWpcwHqGCH5kF054LSaXmFh2PybXurFDm+9mN4OPupo5pVd74L4ftSPEl0pumtFYXD2gr9r1ch/9mH42LW1dEcOY7/yf4oHMq2/z4+s2lx7iIvb2oC72B986SMX9qY/G4xXm3YbefolSfcKRHMuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yltCDjLnMlIEq4JhYkZ9oucvGiMjgHRnvn7jSo7Xdss=;
 b=cWu178dUM8y0FgBTaTuhKo5UkaQjuS1CUw8KKGDw9t/eBRW8LKvJ7pj9BD5ugFONkaaseYam0rC33z/semTF1G07pVtKpnkHdKCs67JFZPmljxYPDUzC7OBP284mLZ+/WGpVr9iaDlbr3yN3obW64n96HLUEEQD03U9tCySn0NAN20u3cRFpV1Nf5MJU0xRcaPxDeiyiTJn77ZBez011SnvDijzDtU4kxUHcV+79sKHCpKcZTGE9LdYtBAiwEbKqEl907Casarfp9M5Bp7Dgva8aY9dWXbz3qj+/xC85vMykEo+etXOi7OG9WdnXCfE7L0ZgaOtS33i1sKcXT3PaKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PPF84B7B0C96.namprd12.prod.outlook.com (2603:10b6:61f:fc00::618) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 06:07:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:07:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 15:07:21 +0900
Message-Id: <DJ4AKSVWGAKR.17JLX3Z610D7G@nvidia.com>
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
Subject: Re: [PATCH 3/9] gpu: nova-core: return FSP response buffer to
 caller
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-4-zhiw@nvidia.com>
 <DJ15E264IOWK.3O2HF317B5UDR@nvidia.com> <20260605190411.4877e6d9@inno-dell>
In-Reply-To: <20260605190411.4877e6d9@inno-dell>
X-ClientProxiedBy: TYCP286CA0295.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PPF84B7B0C96:EE_
X-MS-Office365-Filtering-Correlation-Id: 54edfe73-8a16-418b-ebd6-08dec5ed604f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	4AR5faKeG+s5I++xditXN/ZZh4ucjhQdfQNZHFhP20sx7uz48QO3AKybMw5/NWMV+qXJByj9KgZ4rzNRxNQ9gNOx9ARyGRujz5PO9WL96cSp0w7w7p1CA+f3cpJfX3ituY1LiCDl8DzNJAkKv1M0ow7UYVIGgnvvWlDP4MryTtEg7F/PdtPxsMAL4d6lzWK5fU1tFVN6JNDHtJx5c4UrZiHuZY5sj5IroJPC0w0GEmdUzMypSBQ1slJ0YY+hJjIgL7nOybKEF/hY4aoQuCrjcsV9NmEsr56or1rfa31ztR3L+Pu+ci2AxgavfLUUZv5tyoaMQQks2x0vGtX6g2u5GbaTK4Z6tkjiivCm38QKalHIGwA8mvW3/R6LUDMGIypX4kEpzdlAsAhGxbNl9I2RYg6iDf8BaA8qiGaBGetvror7ovi61yUgtCxBR2WI8BJ8Z41UETK+ovlFcq40mDEuADg3bM/GDGVH69eMRIJ/pcb5mBSzl5BylUetM13KMzX6CgqIcILWr+3iNuiCHitk0NoEmGqWkSc6oV59siCI39VPuuB4J8/28RI4Owh/d+F8XZ1xv4mvFzpqJIhNFisyClynA7jrUNq8Gye4iMWA768jHNIwfRLpNNS0Ll+W3UtIkv0GK3zWUfVQRw2EZMa7HToV4iXHTAhy5Uf36VBy12KfjPzK8XtRZkROLljKQfwF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3B0M282OSttQm43MWFGN1dkVjN4aHdkclpnK3dkdmM0Zkd3bW5nT1hqa0V5?=
 =?utf-8?B?M1lIU1NPSXk4NjlGb3psQ3d5bFR5L29jbDJNN0w3dDFKR015b2NjTXllQUk0?=
 =?utf-8?B?YTREWEJjaCtVNlZiUTQzcUNUVHA4RzlOeHI3LzgxQktQQmE3c0NFN0RKSUM3?=
 =?utf-8?B?WEZ1VVlMd1ArWVYvOE84ZElPNmFzY3p1WjBvMlpMRjRsOUdjOW9FUmFNWHFY?=
 =?utf-8?B?NTJ3b2tsclQ5bmNMdnhBejdINlBxQ3d2YWJyMGpmZi8wOG9JdnFhWURzYmRn?=
 =?utf-8?B?NE5HRy81d2hQNWdBRUROZXNBUWF6bmQxbGJQSGpBNU10OTNiYllOSTEvRmFN?=
 =?utf-8?B?ZkdQaTkrclBOaGtGdTZ6VXg2aDNTbzVDcEt5Q1YzSTRBeXU1UGRSb241Rjkz?=
 =?utf-8?B?cnIrQVI0VWZTcmdQVHRRWlZxSUltcjFzQTVlM01CUlZDMEZEOW5Gem9QNjNL?=
 =?utf-8?B?T29zcm1IMzV3ZitKTlFLakJ2U0s0TUVNT0k2bmd4NUJEdkVEY1VFdFVxOVZK?=
 =?utf-8?B?eTUzRmV5VE1zNFJPSmdJUUx6dXc3QnhlMjVPaXI4a3JKMjNZOU8zU0hiVVF0?=
 =?utf-8?B?QWhSS29Hc1JVZE5iNldMc2YvdDllVjM5bzhwV0ZpWTVJUTJGMElhRGJ0UHp5?=
 =?utf-8?B?QWlFSE9wOTN1cFo4a2ZGYlhWL0s2eTFieHUxS2RwdllQa0xtRVQrMnVvRFNU?=
 =?utf-8?B?RHFIWDIrb2h2MlViQmErZXhrNkNjaGwvU2lmeXlZZ2xlT29UMXl1TWZZQnpo?=
 =?utf-8?B?SDFYdE1FbElRSXNRQTltRWl4d1RIMjRnekpwcUYwNG9ZT2ZHS1lDeFplNTlZ?=
 =?utf-8?B?NitJNGVTUXVmbjlMR01UaFFFV0VvNEkveFlyWXFNVENrYlJtTnE4UEtGbDJq?=
 =?utf-8?B?aXl3L0dWcEtUQmMrVEx3MnNHWkpFdzV3Tm5hTUloR0pyVGNwaXlSbmFQZzIz?=
 =?utf-8?B?MDNaMUJYOHBEOWdBbDllWHljSURQZVQrZitXU0hVTmQvclE2OG52TmJpd3lB?=
 =?utf-8?B?dzhYTXZob3VkN0tlMW0wWFE0bVYyejc3S3pTeUp3OHFEOG9zTDBVNVVwV201?=
 =?utf-8?B?QndOdE5KREY3aTFLT29pdWpaMXVCdm5FdUl1N2tiVC9NanM4MllSZnorb1oz?=
 =?utf-8?B?TzdSS0xuNkxadGtkY2Fpc3FZcFBueHlleU5Sc0JsM0w4ODg3WEpnVWVSSVpk?=
 =?utf-8?B?eUppaGFwSFF2L1I3bFExZFJQNE1qV1RwZmtMMjNrM0lTU2VKaml0ZWNVb3ZY?=
 =?utf-8?B?UkhZK2t6VGZMMUZ0V0RIVnRqTys4TXFiemN0ZzhhcXVTdk1LRnE5Y1FzTEZt?=
 =?utf-8?B?VjEwS3ZYQWZsRm5jUGdablVpaU1OUnh2WWk1OElQMkt2NWVBSUxNbXhPU0RP?=
 =?utf-8?B?eFdsVzVFU1p3QkZ5djVNOTR3THQvYzhBK2QyRnVuWCs2azNRSXJhZU51ckVJ?=
 =?utf-8?B?QXFpaURuYUViZFRVS01jQTlnMmtDN1Vya0dIaTN3bkEwUVYvVmN5VVkyWGV0?=
 =?utf-8?B?L2Y5T1NKQ0JORG41ZDBWRHVoZzVrS3hXeHBYdkxZUm9HYWRmZ2Vja21TeitW?=
 =?utf-8?B?VkRZNnlzQzJWekMwR0FKUnh4TG1tdTNQT3hSTENzb09ySlJJSDQ2Kzg0V2Zv?=
 =?utf-8?B?ZHBNcHhaU2h1TnF5QUhiNUp5MWtta0ZyK1JCK2dRL0RoQWdFT2p3NjZVNVZv?=
 =?utf-8?B?TmhYeFoxVjJpSzVoa08zeFk2Z1U1OWp1QWdnYXlkZFhuYkZrZkIvTmNiRUR6?=
 =?utf-8?B?MlFGVjh6RUdtM3orck0zdUM2c2hlNFIrc1plSFRCOEM4SnRLL2hGa0d1REZU?=
 =?utf-8?B?RlduQUNndmg0WXpOUEZqdDVhUDZ4OGtQUG9uSGJaaTZ1U2dRT0lDYXlyaWh4?=
 =?utf-8?B?ZUQzdmlYWkswQTBtdm90Nm1lNUFVenpBVXUyRzd4VjU1WU5PeTA4Q21NZmUw?=
 =?utf-8?B?VHg1dnlhZkZYVTVnUnZQL2s1NURlMisrVjRUbUVLTjNTM1paRFpiemNONVJy?=
 =?utf-8?B?Z25rUENJeHVOT2krc0htcit1L2NEWmRwOFI1azNpRThjQmk4UU9PMEw4QUEy?=
 =?utf-8?B?eDRkRVgrQzYxakxrM3hZTEMzckpYaVNrMFZwSDBaaVo1U3VFYlhNRkFhY2Vu?=
 =?utf-8?B?ZDZZK1VVaVQrVk80OU1ubkpRWkFUaXJhNk1LUXE0bjFBSXRhMVhmQUhEWkxH?=
 =?utf-8?B?VG1FcUtCeHM4UUQ4Q3hZMTFleGpNRDU3Smw0WHFLcmFRdlA0TW5MRENHNGs5?=
 =?utf-8?B?TXRLMzZTQnRtK013YXlvc05INlJMVzhmMmdON0JMdFAzQ0E1V0dmRDBMYVVo?=
 =?utf-8?B?VEdHY3ZxOVdUNWFxVzliaW9ZS2czNmJDTW44RWFpZDJhNHhQakhSbUxmb0k2?=
 =?utf-8?Q?k1ftfHnq59pNpyBZ5eKXnnaAYv8PmyIvaRL9vW654wvxE?=
X-MS-Exchange-AntiSpam-MessageData-1: 5Seg1QgcDjMtwg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54edfe73-8a16-418b-ebd6-08dec5ed604f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:07:24.9172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzj6DZ5xJamHzCDVttgKgwqRT7+nl3qPYfs1Iz07PeAXwsd6QA7Cx/Kaoq/S+p/rmkMgVOhDYFSSLg8NPmQEbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF84B7B0C96

On Sat Jun 6, 2026 at 1:04 AM JST, Zhi Wang wrote:
> On Fri, 05 Jun 2026 22:25:27 +0900
> "Alexandre Courbot" <acourbot@nvidia.com> wrote:
>
>> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
>> > Change send_sync_fsp() to return the raw response buffer after
>> > validating the common MCTP/NVDM headers and error code. This allows
>> > callers to perform protocol-specific parsing on the response
>> > payload, which is needed for the upcoming PRC protocol support.
>> >
>> > For the existing COT caller, the response buffer is unused.
>> >
>> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>
>>=20
>> Same as the previous patch, I intend to merge this quickly as it is a
>> local follow-up to the FSP support.
>
> Thanks. I will drop patch 2 and 3 in the next re-spin if you take them.=20

Patches 2 and 3 have been pushed to `drm-rust-next`!

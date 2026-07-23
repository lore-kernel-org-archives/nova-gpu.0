Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041BA3E49C1
	for <nova-gpu@lists.linux.dev>; Thu, 23 Jul 2026 07:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791433; cv=fail; b=GuxdbCPaE2W2qcf2LTWIodchWRblUaBkFbiWDsth2pQK84IwpQkQ2G5Opo7ASlmKm7Zx4QOg1Jc9MGNNrWDQFbUzQDv1gkv2Fb/IK6ibN72joBBNlutn0Gk0NTHzLqWqXL3DeCqfc/ueLeF53vsc3wrpsbE3Tw6UXHlZuVWfojo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791433; c=relaxed/simple;
	bh=+aLXeaRpxccTdwsv88hKCg7ebWCNWFPX7AG869T5KAY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kblaAt4mqgXOlmelxwHzGQpkACEGbeNJi1pU3uJ2rLGK02HRukvT4kGK6EDfIilBFtlk7FNgeaFzeZQIEi3CTaehFIU+gT+l1hoLCpvC9SMDleSPCv0+psM1r3lLKHvLTGUguM+aBBxYmkF9s9n+VZHmOG40kWvMzmEwPbT5h+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LdGHlsIF; arc=fail smtp.client-ip=40.93.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LdGHlsIF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck9F9ciASQ7ySeBkXkmqPeurigI6chjlV6mlp1xxTZEsZSiNYrGb/O9WbcQaYcelGhTCdfvfeKxi/xViFyVcbeD8bOym2Elz8LgolgIcd8GspwXBf/cDLBM1a70zMkUvYE7aTpa54scnKm/9FJIj1eCWsNSMHm1FU4ygp6a14l7+qFkFpKQ5bC7qZNRLtMAnxy0QPvQlY90oYMiTbUMbzhX/X3mUci1uXwOyzAHR3pSjHPQs1yqiF45eiHMXkGII0DlUnxu2m3dce1hAmubCJ5KYwMp2o0BislJboTVGOtkwcgQQRSAwTZUSH1HA8P+elpyEOtzXNKUBTdLs2ZmVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aLXeaRpxccTdwsv88hKCg7ebWCNWFPX7AG869T5KAY=;
 b=ffYJSk0hdHnPN6e7bzw9RnRZ9n6O39XyYcDPE2clkk14gqh9SRCxh+mXI4AV/m6NkpRrRQgPKT8yXIkadwmg1m4xfLaJOpgkWWZgOEgtICSmedLf6vim7X3GjRlZm/CfRRJjWAvOr+S64FoahZW6NUgcMc2emzq9cWSJl4RMjdc3RkDe89OD3a+Z4DxQgh9ucNQFvT+ZTqjL4+vB3t/mM9DrVnktUim4UACiTADOmTDWc3ACf6oPE6N6nKFL3QA+A4inGc4J+oNXhLOvY/aSypKJCwb4HWhm6wro3Lgi2qchP02nn9P11Nsd+zi+rhb461hTNUZKUiuisXK/CGZNDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aLXeaRpxccTdwsv88hKCg7ebWCNWFPX7AG869T5KAY=;
 b=LdGHlsIFP322G4Tnso61Rp9rJbr3DUi4En/S1vaD1qGDqgc9my/lR6ZFVpSGza4flvX81lCk3sZJKyLXJabGdhAf12AVI/RtCFbciLw85NSx6sOjKu+74mQ9YT2cJmdDkX+D/ar0X1Je6dKnIE+xuejMyUnS+oZ0T8ZZgMb8LtpVzGk4ehPhW1rbnkp4dY8xn88nRWWwG78X8S1A1KEkqIiHFFB6u7m8fBqesYR//qYcionSM1A+SBV8EbJaH5s3/jOt1SdUhgHyZigjcUPAaArMAko9NSe0BckuCmTyVp/16TzgikblBvDbVe1xXhLrnd5lx+dq7nac9gwqddymHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 07:23:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:23:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 16:23:40 +0900
Message-Id: <DK5RR7ANW3MW.J8M284UMKBT7@nvidia.com>
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
Subject: Re: [PATCH v5 6/6] gpu: nova-core: reserve vGPU WPR2 heap
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
 <20260722073913.1807677-7-zhiw@nvidia.com>
In-Reply-To: <20260722073913.1807677-7-zhiw@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:604:218::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: e5cdfe56-6656-41af-ce90-08dee88b5407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|7416014|366016|56012099006|11063799006|10067099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	vb3BrzZuEveeIqjIQsCwwnpQCl+ahCKvrO2NTVRKEk1YvH3JvrNpOP6cVKsGbUREiokZW1nmJOPt+i8km1s998DwyzT/OP41SDJC6iZHRE6sTWtp1KenAMMHgilU6vwwaMJRuB3utj9CbW2trg2rKzSvdlhUQVFNJ9GS76mo2ezPk8n3xPNVwWDXJ/a/TdFHmffdC48j4XBix/CkTIHdgPAFEk4GSLmIEbjjmKfbjsyBDxST+cpXX6cmxuqR9ahrkYyVKsorN5Sh/JB6lEtWF3VC9Psc81743e+ZuAaEsJQBI0gpLXTirUfjv4sh2jFXq8JXv5+XwESAh/9dpb/TTdlsIzWeil8KI0yMh/J0psNMLlEBA1vSAhssZi2jMEy7NNZPEQM/xULeIAsL27QArrm7Fz1CRa4nLwvdC7dU5RS0d50xAokQCUZMTMBhNvrl4KbZl64wvpFvXhmeKS5Exgx9lg4W4xZSavC8M8WQprxR7IO7KA5cw9GnvZMrcaPjGlMWc+sXlsZb5fGqveZD7TH0z19KlXVnt3TE7wo1j6cboDjX5+TmN3jD4oFCopKzwfsddSFRPEfZfMyXmnAJSDGnQdHULBXeF3gA83XNpJlUH4th3KVBgm8B+ky4CjPamYWFcdSH4prfgFtcWkpvfys3UU/ZeGr2NVuE4xg1fgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(7416014)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzZXL3pyYmxMUWlhWUdTUDlGNnN1dGlUWU1iVnYzYzBwL3RibU9DNmYrdnJL?=
 =?utf-8?B?dDFPM2Mxa0UycGxFQzZwSGRjUjhOWWxwdHdkaHdGeGxYc3Z2a1UwKzFNeXd5?=
 =?utf-8?B?Qkp4RlcwU2pyNWtEak9udmRXeHplQkhheGtUMW5Na1p2Nm80eEFqS2lhOGVR?=
 =?utf-8?B?NWdRVllZN3pjRDNYamRyNk1ra2hiU2h6WHAzTWxXRno2WnNWNnNFNG9sY3h0?=
 =?utf-8?B?Y0QrcHRKY1I1dklEU09KSWloY1kzQ2ErQVJPRzVWOTFuYmxJdUxmWEhzdHBJ?=
 =?utf-8?B?cUc0TVplQW1WU2ZqOUVFam50N3NXeDNLQ09Jb052QU5KelFpZmhVdWhzZGo4?=
 =?utf-8?B?ODNCby9xUlo4V0FrUmIxZ29BcFdJeWFiSmNpa3FqLzJ2TE9ReGVORFVFTUFK?=
 =?utf-8?B?aU50d1dQZk51WTlQVU9WTitkM01oK2JDakFmWkpzeG96ZFpxTWJKR0FQTjhT?=
 =?utf-8?B?ZVRaWmo0Y2VSK0hhN0lhSDltT0YrbFFMY25ZRzhFSXVEbk9WOEI0cVF4YlR2?=
 =?utf-8?B?YS8wRG5UOEhUOTZhVnZ4WU1rNWpWQVlubG5ON0xycUJOR1BwOXJBL1B0UTh6?=
 =?utf-8?B?ZDZFa2JJQURTK2xINUNIK0pTRlArRUVDMDdzVXRFdlJONFlLRUljajI3cVE2?=
 =?utf-8?B?VENQYTlTUzByNmlGcS9PY2FCVUFmUXRKc3VZeFUyMFAxZzVpZU8yb1Y2di9h?=
 =?utf-8?B?RkJJL3JBN2srZWJBSnpQSVJqd254aHlUanVkTkc4ZTRLWEliRlBpNy9MOVg5?=
 =?utf-8?B?N2NncFE1Z1hReG1YS3BZUXd5RytxbllHQk9oYll4bWpLMjlYczBRWE5ETUh2?=
 =?utf-8?B?QlE4VjdHQi9tc2ZHelpPRTNpU0xHd3pjS2t0ZlUvb212aGI1NmhFbEV5VUQw?=
 =?utf-8?B?N2hCNHdvWDJMSG1CaEgydzBuSmI3cHhnaGVCaUFDbUxERnkxZWo4enBLWFVu?=
 =?utf-8?B?aVZJUmFENmRpOGlNMkNPL0I5ZW9tYzRmT1FFUzZjS1RBK0dSdXE1bWNsdG5t?=
 =?utf-8?B?QUlwM3YvSTY3V3V0VGZsRGVLTmFCSnF2RWl1YWRnY29lQXlLckhlMVp1WFBT?=
 =?utf-8?B?N09MbGJMd1M1TkN5VThGSzgrM3k1aytKL3YrWkRCcWt0YTJ4SGVRU1MyeWtz?=
 =?utf-8?B?bTBtam1IYk56L0w2SUwzYmdqcDAxR2VIYTMvN1czSHRPS21YcTB0TDRybk1v?=
 =?utf-8?B?KzVGQVpOSThXdjVQQmtXVWlxaEREMDdsSUNBanQyQnM3WGFjd0hrUWhLUlJ4?=
 =?utf-8?B?N3Z5MVRaRkZLMGNIQjhOc1RHbG4wQ2JNUkVLU0ZCY2tVR0RFa1h1SG5mTVhm?=
 =?utf-8?B?WFRpcWk0WkpQbGI5amZUWjFMbCtycEFUalUxNi9Jbmd3L0x6NVhWbXJDcFg4?=
 =?utf-8?B?aFYyL1pkRk56dmNOYlJoZWo0b281TEdzQStTY2hPZnRuSmNabmF0OWpYRkRr?=
 =?utf-8?B?c2hpQklheFAvbTBwcTY5QmF4ZjRKT3l2N296c1NMM2dxMmR4Y01VS0h5Q1p6?=
 =?utf-8?B?UlJHcEFkZ0Mxa1pmVmZPRmM0eEpaUFMwTUlFUkFuK1BQMTJoQ0lIckc1bHlT?=
 =?utf-8?B?T1hMR3BFRjhDUDR4clUvK2xWUkxEcnNUOGN4N21IQUFWZFlZMUNlNXlnSDN4?=
 =?utf-8?B?ZFVXMEZ6bDBkTStyZDZtLy9WeWIwcjhLclR6aFZWVVZPanBlUkp1NjVJVHU0?=
 =?utf-8?B?T2lweThOcitMNTZJQTAxSVFhaGFGZkZkeFhlMHB3RE4ycGtLV0hVc0gxQXgr?=
 =?utf-8?B?clZJU0hMNHFJR3lqTjUvL0diWHhUYkJJU3JsbWZaZTY5VlIvejlXR3lFREhO?=
 =?utf-8?B?MXdTL1N4ZHBpNWlQOS9YaGxnOHgzLy9kcWdERUhKdGsxWC96MFJZcFJxWEdR?=
 =?utf-8?B?NDNuQURVNFRLaXpjZndKbXFEd1N3UXVsZGZkWUM1YUx0MWpTSWkwcTFKQTR0?=
 =?utf-8?B?WVZRSERMbWpaUVhRakZaeUxqMGdiYzE1QUtuQ3Q1Tlg5RERTeXJIS0Q3aEN2?=
 =?utf-8?B?aFBJek9Jb0VLa1owR2Z6T2tsL0xpYm9sMjRJWjVIK2QyQVFoL0NoMDlnL1Mv?=
 =?utf-8?B?MHBVUTVMc2c1ZHpkM1BmTUR1amtRcG05MkFXbUhmcHlKUFNNWnA0WW1wb0o3?=
 =?utf-8?B?NC9KQVVIZWVvaG5xajhSUkhibHVxeWVLUWFFL003YWdId2R3NU5FSGExMnBh?=
 =?utf-8?B?RURXSXJmU2prYTY3dlhaZHRIQlJJeHdqYnpXbHVzdTRQS1FjbGRBRWRFaXFp?=
 =?utf-8?B?MWFGekZwc2NEUm9pQ2RPWkpubTNuL3JLd01sa0NpQUZOeXkyaVJFVURtRjRK?=
 =?utf-8?B?NjZJNlV2RHorSVJpNDl6TFBnSm9BYTh2bFRqeUFXVkRUNHc5Y0R4L2VJVDVz?=
 =?utf-8?Q?M1oYHB7yIp8CfKOSA6KNWsex1zv8hVVdkjkJ9hs/NwcyD?=
X-MS-Exchange-AntiSpam-MessageData-1: ZIc67pNGNCddrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cdfe56-6656-41af-ce90-08dee88b5407
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:23:44.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WlPe2ho3dgt1FirMqyQr4oE0Y9YM4JBtNqfUTd4z2x5RLKYEfWY4m6P+dXrt3d6wDRfKuxMSAeAYi/kMOvRKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8479

On Wed Jul 22, 2026 at 4:39 PM JST, Zhi Wang wrote:
> GSP-RM needs a larger WPR2 heap when booting in vGPU mode. The heap size
> is firmware-dependent, so it should come from the generated firmware
> bindings instead of being open-coded in nova-core.
>
> Pass the detected vGPU state into the framebuffer layout calculation. Kee=
p
> baremetal boots on the existing heap sizing path, and use the 570.144
> vGPU default heap binding only when vGPU is enabled. The same state match
> also sets the VF partition count, so disabled and invalid 0/1-VF states d=
o
> not enter the vGPU heap path.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

I think Sashiko has a point regarding the possible subtraction
underflow due to the increased WPR2 size, I will change the code to use
checked operations when applying.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795087276;
	b=v7O/XEHMEA5CTZNU5jf/Ti0tWvw0bB9grHHVhBeVer6pmFjYlU9p4oNi+Q4WFx0hdbaK
	 aSfIBH5yBNjlzydubGmgAf3Y8TUid3IWj/HCmFNAhj1yceC6aeHw971BO4S/M7+AxBwD7
	 5fsnJDwjqbxgmYDqSnUCpV8MsYPrUyOnRh5dKmXzuAb0pZK380TQsJE1TwDPtT6iBSpTy
	 yVfLWD5qc2UrbPfMtUCiLgOGKddjGfanKrYAxcFVADCRZOc3pJ99GH1RIPXVqtFQmA296
	 HkIrcvy8O0rqZ+Gpbf5TujuDYlYN9Qn4TYWf4RKg6l8E86WGSgfLyGCmE2jldekLP2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087276;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LExJgTcK+lcNTmf5sktebOy5nfMif9WqSEibeXU2O0o=;
	b=oRkwfgVlfpah8mXKagX23cAhoBQiY3CEI301U4pMxYuxHbHgL6iRQ6vryt5sEG9fZFVz
	 pOTKZS3yDTAdQq4UvU1SZKr/EpJ6fAoeJS7wCXkLJqRMo52P/n4+YGd3owlzd1yEqFYYb
	 OhPQxCm3UnVO/DSmoBJr1ARnRK8DBqXW/puRzpFiJQ+VaZ6HkqiPArykf0x2azudqPiSu
	 JBngD7EWOwmyA6TmiVI85MNQ2m+WCb32QJazGSGad8m9MLdwiq5gyeD+gMlprzX71hW0T
	 CLzCvrLLM9n/kHbn7CNSXn5sKHXZwvNKKP0Zt46f60OxE0HqtEEwPMZ9y4rCsT6Rfow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=o2zBB+1V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.112
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020112.outbound.protection.outlook.com [52.101.195.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63301606A330
	for <nova-gpu@lists.linux.dev>; Thu, 19 Nov 2026 11:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63301606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=o2zBB+1V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GybqQVpvjwbdLMa/tU+eT/Num1iUPjWtHTitw6TWZZ8sxPs/9+o8y9mol7NL3+Yo3CJI/VF8/gflcAQGtXAVDDz1n8ad8F+/5ntmYodx3KTia1U0QF84sLqUCm8fTW9k+BemJuMuxrLUc38nJDzM5DzWIWxQRSIbfJt210Z7p6oeGBmiFsgC9k5v7aqX/1tGFgi7/9ehJBPROqGVKWMpVqUYuny0XVTftxBNsb43HDIHLb8CtdqUhKq2xMttt3ZAiZ7ULRmOEApxowZUHz6RQj4s1irQCpO2Mkd5jEG/IfXjtyTHTiErka+uJ39Mu5yN5dZGHXDPR2QvhM/fjCHnIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LExJgTcK+lcNTmf5sktebOy5nfMif9WqSEibeXU2O0o=;
 b=PcZjOoiY4OXKzb30grTLdVukTkzJMTRNIG3YUpu+/2DutA3tGLUGrZTx8V7xZs8onr6iAWwgF15n6jxczcB3SABLuvUq07rKr0p/E6060CY+KBg+DIi1OzE+KT/CL7toDtZIcaq1G706J8qkH6ChT7abED0vmlD+ahtwP0CiaMi4LbRP6u3qHSjRFmndu5lXJn2ki0JOx0l0EiUHCSp//RjEi0J/oNccksL04zNWzS6cuEiBBmB0IeTMMfyrYx9eEUMMoXiIpik4j2MX0WK7RUEMIv+eJ01WVqtBXbOC6EGRW2ORQoKW+E+wfAQGVY94sj5HuDNMJkzSrXhcjYdlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LExJgTcK+lcNTmf5sktebOy5nfMif9WqSEibeXU2O0o=;
 b=o2zBB+1VPmBA0D5AeV65JqpqLb5lajbVuc7JTXAXdXigaNeDTdNEVruKoxYLghqkzU/XqvKsBA2PIiuHuKY9q/MljfTYSdeteqdJBkD67BtLO5cb5aeWHlPBl6L0ibC/0gaXPfLvSDDHah4M5AYTOQd5b62ISDSRCmqrLo/zZd4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO7P265MB8543.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 11:21:12 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 11:21:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 11:21:10 +0000
Message-Id: <DMZ5BVNPA3LK.13FNSF2VLYTWD@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <daniel.almeida@collabora.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <tamird@kernel.org>, <work@onurozkan.dev>, <brauner@kernel.org>,
 <lyude@redhat.com>, <j@jananu.net>, <alvin.sun@linux.dev>,
 <deborah.brouwer@collabora.com>, <laura.nao@collabora.com>,
 <beata.michalska@arm.com>
Cc: <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] rust: drm: make Driver::File
 lifetime-parameterized
X-Mailer: aerc 0.22.0
References: <20261118163203.2483856-1-dakr@kernel.org>
 <20261118163203.2483856-8-dakr@kernel.org>
In-Reply-To: <20261118163203.2483856-8-dakr@kernel.org>
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO7P265MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d65542-576d-479b-31df-08df462f3740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|10070799003|1800799024|22082099003|18002099003|921020|4143699003|56012099006|10067099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	xbe3Lf7ZdJq+XErDNLt/yjMYC8y9GmCZdzligF6SD9raX97VrBMm+jlGw5LsckZeNDW1ytJ7gatKKQMzirdmyx59Xwtzzpa0bX9ABCsD94zLNdtc5TANZPbeL5AFON/SfMy4Pbyycj9uhR+GyR1d+vZX8hyl27nXjGtRoEpeaCljYvX9XEQZ/mljF0dog2a4m01rSh/YKr28wUvuQciP9VMarbWVg8NkCfmNTdI4XFcqx46tDJc8ngpY6ruAMDasASfiMfhWoibg7Zl9DDjttFGOrgmSrgrVMYOLHCMzPx1k78VqPJbTtKEoPORWUSbX1EOQ6K7jmEV/FhgvJYBxYpOIxw35DxdiLxc/4PgRLBoieiChGJiM9ebX39+C5OgofAUr+mXJKpxD7uMDU5x0lphfwodrtQw9DTqSDdN3mxuQDWJzYMfewGF4g17V/7qeBLWAvM1qx0eEKydoLYUNrsZ7Hn9bo8s2Gu0VogucNasyHZ4Wqpl9hhKqpE41jR3GI1EDaqT9VrVm4s36eJKB9ene/zvxgGWZ2wtIueiT6FKwyDFOMkqsoP1+mmFPNCrr2VuV7dDa2yjkx9JSvx9BmmZqqT/1cmtHzxnC8agfuowXG5w7QT2teag0/SO7K0d7NFATQ+XD3k+nzpmTDHf68YSt5Rr1GbNjd9b9FTXaumFTcobKjAehTvn/CmQ1Mgr03fqJrcTyzpmMj7CnOY4i+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(10070799003)(1800799024)(22082099003)(18002099003)(921020)(4143699003)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0F0aG1CMEMwZ3k2K3RibCswV3JsNmxlQUJOTVQ4KzlDMFJWckRkRTRzMGZS?=
 =?utf-8?B?c1Z3czI3QnN3L2VRN2psMEU2bFBtWHlSZis2V1lqM1grcUhqK3FQajNNR0N6?=
 =?utf-8?B?WU0yZzh2aG8zN1lmN0J5UXFKRU9RcXlPNjdQRXFLMTBQeEFTMmlnTWRBTHBv?=
 =?utf-8?B?YWJqTm9MaTArdkZNT0JKZXF1a290Nk4zdVVJVVJxR1hKNnFjaUl5Y2UwTEZI?=
 =?utf-8?B?U2xTTUYzZnhmUHVDVXIrNmc0eko5cDRVY0d4NFloS1dkeUxCUlpockF6cm10?=
 =?utf-8?B?WEszRHdJWjFheEZYWitNM0lkTU85OHM2eTRLZEN3Q1dpS1ZlWk9MRFFNV05O?=
 =?utf-8?B?T05RMmVybW90SFZBWWxreEVHRkJWTjhLQlp2UU5wSTZIZDl0TG1pMThoT1Mz?=
 =?utf-8?B?dGZqVEFsQ0FOSnJVVFppWFZiS2M1ajAzTkc4Z1BiTWZ3Q3VPNWNlRWprV3FT?=
 =?utf-8?B?NWs1MVMvaE1HVjdIQXEwcXdnTXdUNEVkRnBrSEhtNTJnZmdDM2xyMGlrSnQx?=
 =?utf-8?B?UGZ2SW84UXlScDVYTXlscmpBeGFlY2d3YUhGcGViNnU0Nk1zMEVkM3BrZnpl?=
 =?utf-8?B?QlNreEM2NHBwMUpybFB2OGU1Wk8rYzIxTXErODdhR0VQQk1XS1FoNm4rYURu?=
 =?utf-8?B?b0hjbkZkWTJjRGVVZytvQU1vU3k0b0hDR21tMXlRVXBxNmJIcGFzSERoeWhU?=
 =?utf-8?B?Ym1vc0ozZkdjQWtDTlMvcVFQN3NWMk5PVzhFSmplbDB0eFVoWDIrbVVBaDho?=
 =?utf-8?B?Zmc1d1FWR3ZraXhkZzNXSHlFbnEzM2FGUW1GZHBXNkpYY1lKMXdmV0sybUVI?=
 =?utf-8?B?SGdxemIrWkxLTmZxZHFEUFlGQW1sdjQwWVlLK0Zzd0dxZWkyenlhcU9hSWJN?=
 =?utf-8?B?Q0p6SUM1OUhEclpscm9XY2wvMGMwUWNocEVQYjhFMjFaTGR3WUUrc3dzdjZo?=
 =?utf-8?B?SnVQT0o5dW5SWU4rYUFhWnBMc2lZcjRXek40M0ljdWpSRlY5R1FNV2IyNzIz?=
 =?utf-8?B?T3owTGZqQXVieWNCQlRXM0NjOTdtdUpjZkVTWjRJWFp0VzhUQStUa2NVdDhR?=
 =?utf-8?B?ajBUeFp5WjU3dUdybytXL0l2QmRKdjlaVWNQcGg0WG91cmI5cWdCajk2bFE5?=
 =?utf-8?B?WWNXUHZUbHYrVnhQVitub0s1Zk4rTll2Z0NVU2c5Q2FQQUgxYTFKTFIrRFlu?=
 =?utf-8?B?MDIxdjQwZ1l2ZERyWHk1cURtejZESGZYbG1KKzFLb0s0cjd1UU1vN25JUjEy?=
 =?utf-8?B?RFVmbjZPN3dwWHdEWStIU0dSVllEbUdsTEx0MTd0STF4YmJWeC9FVGtWenJi?=
 =?utf-8?B?Z0tJZklDOE5MSTkya3QvZXlxd2hSdHIwRXgxNDV1cGVNUzQ4RXE5QXYrSzcw?=
 =?utf-8?B?ZllTUlFPZWhRZnc3eG92Smp6QXZKRHovaWZYZFRLMytCV3oxd1h1Zjk0QXo3?=
 =?utf-8?B?L20rd25TVjUvK0JmOHAxQlY1Y2V1YmRpZmRGNE9MSWxNZ0R2VnZ3ZWlFUVEw?=
 =?utf-8?B?bGFwU0h4STk0endWRlYwanh3TkljRlBCUmRCaGQ4a0ZJVDFvdVhhN2J3M3B4?=
 =?utf-8?B?QzIwQjJBRUhhRDdyM0hjQ012UEoveEd4OHBMeXBlVm9nWEFrN21xSUZzYWxI?=
 =?utf-8?B?eEdHbGdlSDh1bHg3MGJMYVRWQzR3LzVVK1VjMVUwUFBubExzSCtDSUJ5a2R6?=
 =?utf-8?B?TlNsWWEvOTJlay9PYTVFV0ZJL1lYdkVDUGdRM1VQV0dZZUtjNExJQ0NscEZN?=
 =?utf-8?B?RGlEZWttZFdPSmNtRms4VXpjVytDbXM1aTVNZCs0U0luK2RUWnY2TUl1ek5V?=
 =?utf-8?B?MGF4MFdkZVUvR1A0UnppNXA4OTdqNm1mM0pYdDUrazFLZnNPVjRYTm1uajkr?=
 =?utf-8?B?YjZ3VHY5SWEyYVFseTlpNXk5VlczeEdpUjU0T2VqQnNET2g0NmRwMERaUGVV?=
 =?utf-8?B?RTdmMUdydnc3dkc2NG1mL3lORWFXaGx6NWpzRFN3djVWa2h1Z3NBdUI1bXdH?=
 =?utf-8?B?TDU4TjBNb3p6UWRKVU81TDkrTjhZM2dRUjl0WTZrU3hsTGozcU12MElBMk5w?=
 =?utf-8?B?R3c3NkxVak5Cc0pjcllONEJNSE5BT3JMc01QeHAyVlFGUzJsclJxSSt4RkZi?=
 =?utf-8?B?ZHZ2dDFDUUltU2ZaWWYvZm13MTZ1QzhpZDJJdlR1bjJxVXpiL0psVzlhQ3lO?=
 =?utf-8?B?MWV4T2QvT0RPSEM3Wk1RaThYZXR3TzIyNVZTMGVoRGFGVFNoNmZkTGRmeWtV?=
 =?utf-8?B?Vzc5M3FQa24xVWE3NG9VbDl1N1lOeVQ0QmV0TXBBblIzWnVkOEk4dzgvV0c2?=
 =?utf-8?B?V3JickVzV1lOaWY2MDFHYStrTHd3cmVNdjROYjJTbTFEbFh6OWFIQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d65542-576d-479b-31df-08df462f3740
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:21:11.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K88O2heBgPd9tolktzhasO3y6LQmNwjUW/yr88DHkkGMTCfA+RuRuUurBT7U/U04r7bCFK/1Uqx4XfUux3f0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8543

On Wed Nov 18, 2026 at 4:29 PM GMT, Danilo Krummrich wrote:
> Make the DRM file private data lifetime-parameterized, allowing drivers
> to borrow from RegistrationData in their per-file data.
>=20
> Introduce DriverFile<'a> as a lifetime-parameterized trait that receives
> both the device and registration data in open(). Parametrize File<D> on
> the driver type rather than the file data type, deriving the concrete
> file type through Driver::File<'a>.
>=20
> Add inner_with() to access the driver file data from a File<D> reference.
>=20
> Ensure file data is always dropped before registration data:
>=20
>   - In Registration::drop(), detach driver_priv for all open files under
>     filelist_mutex, then drop the detached data after releasing the mutex
>     and wait for file-data destruction in concurrent postclose_callback()
>     calls via an open_count / WaitQueue pair on drm::Device.
>=20
>   - In postclose_callback(), skip the drop if driver_priv has already
>     been NULLed by the filelist iteration. The NULL write is visible
>     through the filelist_mutex acquire/release chain in
>     drm_close_helper().
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/drm/nova/driver.rs |   2 +-
>  drivers/gpu/drm/nova/file.rs   |  13 ++-
>  drivers/gpu/drm/nova/gem.rs    |   8 +-
>  drivers/gpu/drm/tyr/driver.rs  |   2 +-
>  drivers/gpu/drm/tyr/file.rs    |  11 ++-
>  rust/kernel/drm/device.rs      |  31 +++++-
>  rust/kernel/drm/driver.rs      | 113 +++++++++++++++++++--
>  rust/kernel/drm/file.rs        | 173 ++++++++++++++++++++++++---------
>  rust/kernel/drm/gem/mod.rs     |  44 ++++++---
>  rust/kernel/drm/gem/shmem.rs   |   9 +-
>  rust/kernel/drm/ioctl.rs       |   6 +-
>  11 files changed, 322 insertions(+), 90 deletions(-)


Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020140.outbound.protection.outlook.com [52.101.196.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F453D34A8
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668787; cv=fail; b=Z4uKeDYu2p8w1wJQu1nKZPporJGyP3zSlCTh4ia0zB/MRPjQDbGizcoOJcu/fhCTYrHnJM9GSMjmVcTr5dzSlEtTBfzX1DQT2ypBrNRUEAcBI09eI88QMYt2q5VEc+GarxUNDH95ycCB2kHKdp5YAcAjKy0NVwsh/0R3wADwwDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668787; c=relaxed/simple;
	bh=ZzI0ZAAsL53POh0fSVQgt//FmCAsZEH/XG+F78w4oUc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=oxdxYx4ohL5i49xyCWPzKhVlBcZnUC+XbyoRvaky3ishLRk/mR7f5b7aCObE3o9Oixy2ESDlZ/3gMxlA/el3FiXS1g9jUrY0MQWKaDrHFBqx7R1zFdWyq9uHLMFVvSDXzwILd5QcZVb8yXSETU6S7gi78NAGo3/viNSBnc3pgiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TXt5oMlo; arc=fail smtp.client-ip=52.101.196.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TXt5oMlo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cf3bnB2nAmo1Gc+qppNw3Ol5qVTlV5uuMk8qFb7JHJN1YIBZ+bqlWIv3Wl1wmIj2mnyTeg32Av8GJT2mihYL1JZyrOfsVGao+EBDGM1M+3h8dZCDVNwIY+N+Zqqwb26onVcyVMqwgB4GuLrA8au4ytb5Ni69tUsUq2r1ThhRwuK5wuz0tT3MHUihY7Buoeb/++VZMr7XK3HBy/WpTF0kRoM+12syo65jCQhtW05RzKLVwk50AM+4vNfUgvhxfKtevnW4QZ3xR9XGwz9PrD88K4LdcoQl508bXUE6l1Q1tJlUERQZ/37V6UIwrt2iggFrBVF1Rh0fPUtsTptdNHlMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXrLy9XHic0IoxP99foD7g+9Ug5VNr+HxIRSNu0Q8jA=;
 b=KQB5VQ4baDuiWL3y7zNO417LQ9QSagQMx65QXpJzm2cxNWZtmUM9lZmXKNmstFm0OSCLZWZGdhilFafctu4npYTj7oefy97nUO143LMCaQSvxb7tY/8BRg3zcikm3KuikpGrzFuHlj1cAvKj4n+oUtPzwkRnkD03/lyUbq7k+veK0DnuZHzhCkfRNhR/C8v9Puw3PLHVdo+xKzhdHODDmHChx4cXY31bnmIXmB1KC9zlDfdP12v7ieQ823mTbbWKbzmcXq1kJYA5kHQ5538ISFQCicq3d0x+dDrIQb5qhDLBX4IfNlOyrVgOr+bLnEKzAOO2/bHX682CiA8jIi45/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXrLy9XHic0IoxP99foD7g+9Ug5VNr+HxIRSNu0Q8jA=;
 b=TXt5oMlobylLuPQ/XCcxJrgMFO7ApIdFtF/ZFphQq7U1P0CcsQrF+AJo0yoRAAqbl7na69k1iJT8lqFZxAolhUBhy8Ui0bE0IcBdqrYLjaj92pWlqB7gJfL8RbNSyxYBvaBP1uZPagFGbWQJjJV+1eyxHUoVs4bkio4YPydoUMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB8781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 14:39:42 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 14:39:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 15:39:40 +0100
Message-Id: <DKY3P0L34CTV.10MQOAMUR38SO@garyguo.net>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
 <DKY0C2ABKO0S.1DWFMCOBI7A25@garyguo.net>
 <DKY3F6MT327X.2BYD1IDZP8F81@nvidia.com>
In-Reply-To: <DKY3F6MT327X.2BYD1IDZP8F81@nvidia.com>
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffdbf63-a56a-4517-cf62-08df02b6b2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|366016|1800799024|10067099003|6133799003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cjahu4oAospdtzMdBN7hdpNdDeFB48st8X9df0hxe5AJ2CJj4IYe1azAHRCfqTE6LjSU3aSoTQc7EQVlfxqmAKB3/DfzYD8pnF4xgVb+DSoyHSeq4ci2h0svep8VCvGzdsIAML9IDtvrdRrm/FxB4rAK8xASiUlP114rDN5guGRERh/7RoRuYnQrsz09AD+sRtVz+lDrtLdXAz/u8hEBg3L03UVBUVH8m+f3nX/3SDYScBOT5ckG4fFBWSxOcfVZ2Kd/Rvrsui0J8qh2I8Q9061ARnqAH2Tk80J4BRIagD4DQ7HJqeqyJkmMyrBhz7lp+uaA2Ad4ttuZS3vXFRlVqXthRRzqR10lF5cqnqgSuv8MSXqPnau9SoTMqJJHl4dvRrQIXBe9m7+8beDYEU6VKcQMWn741XmlwnvLxqppdnPbgjNFiI4qVJqeKaWu1tnLNWF4Bcmya/AP10N0GhpSBClOX6Q7VNyoIK9BxuH7FgrH/RtagvWICdVeb3APopzG4ox1Vn6IT0GLFXgB+kDziSokgRgpW46DzRsmi/gvIAksCsi6e2UtKm6fmifqBHo3wRNlViOJH4fEm+vj5bjPJX++1VOolgEQbxbS8giHv/XI0vbY34khjp2ZNGDhLxMmSvIbZKsG6ImaU7D1tJDTMyXVktVbX1kSwtzowiZF9ug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(366016)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnJOemVhRldzakxveE55bEs2Yy93bnl3dmp5TGwzK0NhYmgvelUvWS9YbE1p?=
 =?utf-8?B?V09ZcS9xM2dXYUV4OTFPWlFnb0FjUTUvVFlxKzQ4Zk94WFg0Q2d4WUFpdjlk?=
 =?utf-8?B?eG1TNnZSa1Vjdy9NdVl4N3BxYTV4eXlyVlpIdTNPUGZXM05GdVhTU0Q5d2xm?=
 =?utf-8?B?bUVYVCs5aVVFay9uZ3h6WUFiL0RtY3RLbUt5QVgrSmFiS0tpbFBEZWZsRDVU?=
 =?utf-8?B?bW9INENuOXQwaU5pcEQ4U2t2aUhDc2xnNWtoaGsrSHhkVzVkRUdoTGVzenI0?=
 =?utf-8?B?MzJEajFJY0pBY1Y0eUNlOXM5UWhCTXdyb1V5RTd5SUcwYld0R2xqTW4vbGlP?=
 =?utf-8?B?eEJZeTh3NGoybmhBZXJyd3BHK1IySU5zbkZJM2Y2NTdlR1pwdXpYUUxzMDIv?=
 =?utf-8?B?c2RXbUw0Q2JNOTBFWHR2RGR3T3BMRnBGZWFpYUlEemtrZEUzTFJack9SVGQz?=
 =?utf-8?B?emw4RGpTN3h2bXNON2ZQRVN3SW41aUFBRlErb2k2RUxCb2NvbVBkMkZWbHBt?=
 =?utf-8?B?U0ovaWZTRlFxeUU3Vk5lQ3VUdWtkNGJxSGZTSFFMQWVZSUtRenl5Y1RWVGoz?=
 =?utf-8?B?eURCTzVTVGRPMlVoQWREQU5uUFdMOUVtSldhemtmT3gzVnEwVjNnRy9PWE9h?=
 =?utf-8?B?b2dtTVBZWEZDd3ZCc2lQTTkxTi94K3RZWktRQTBJUGZQbW9hOHUrVFp6ZXdh?=
 =?utf-8?B?UnBKbyt0NEl2NEVpc01HTGZIUG1tZXA5MEpCSDNVRG13ZnBjRURNTSt4V012?=
 =?utf-8?B?aUZEdElsSEwrWmJmVjlpV0RxOXZWVzRZN3BKbVZNbDExbGdJbTRBdFBxTWpi?=
 =?utf-8?B?TmNGRTRwN0ZlOTdRWHU4cThxUXp6NWlLdnVTWjloRE1HckE4SVlSTFlxaVg3?=
 =?utf-8?B?a056Sktxa2tYd3lkbkRmelltclh4MGhxU3d6OHphY0drVWovVnZXckgxZlRD?=
 =?utf-8?B?bVptNzV4T1luSXRvbVFGM0tjZVc0cjROMURKbTVKNzF2dXk5MExONmVCYUdL?=
 =?utf-8?B?Vmh6K09qdnFYOW8xNCtROEZGbmNxaXc2UEMyQmdrTFhkVHAwUXVLcGN0WTBZ?=
 =?utf-8?B?U0k1N2o4RGhnWlpZZ2hLeHNTSkEzSHZrN2lXNkFGSlhKdzhuYlJSekVwVHB0?=
 =?utf-8?B?TWdhalh3THZrT0llMk1PQzl0WkxYMGZoRlZZNXJ6SjdIYWd4QW1VTTY2MmFP?=
 =?utf-8?B?a25kRVpMS2djVHF0d1RGd0o2ZUMra2xLSnM5RzZiVjFseUZlMkZsbmk3UmVR?=
 =?utf-8?B?VmMrOUY0K2crYWRBLzZTRDFuNXZzc1FWVzNEYmtRVDFDeTN3Y2tSdVpUMGg0?=
 =?utf-8?B?b0RZTlFNU0VqZi94ZitGVUZZUHZXazFHUWcxZDFvNjBodlFkQWFXZlNqNDk0?=
 =?utf-8?B?SE80WjJ3TnFOL1BaZHVRcVQ1TnljM2c4R3FXYlJQcHhvTFhzd1c0MEM4a1RK?=
 =?utf-8?B?cU1wUTB6bDI2R0VocE1WYlZjVGdIYnJKTDJKc1JyQ25XM256Wmw5V1kwdUdz?=
 =?utf-8?B?QWtSTXlDeXVwTENqVENXSVNkSmQrNFd5UG9zNnpyd1JVZXAwNExWa29KNjF4?=
 =?utf-8?B?c0wxMWxHejlSRjJyS2F0Vmh2MWVGaEtOSHdRc2pINjIrWWtaZTlPYnVCUzZS?=
 =?utf-8?B?RTZXK0JrYWgyV01TU2RCRURabDFPSWJDT2V4dkRmU3VHaHdxdkIvVkRueEZV?=
 =?utf-8?B?YVdMYzAyYVFjR0wxV3pIeWpRZStnR1VCUHJHRzJZenFKdzNpeU9Ya0RPTGhD?=
 =?utf-8?B?enZaQnlxc3VGeTNhSzIxbFN0alRLZVJnMFhXUi9IMUtoSm1wQkV6UVVsOWJs?=
 =?utf-8?B?S01DU2UyRjJMNjlibUtISEJDMkFIMGtoampvZjI0eTV5clc0U2oySDFlb1Jr?=
 =?utf-8?B?RFVOc2dpM0kvR3FKckJkN25lUTV1c3pTQ2VvdmRNdGdRSU8xTEl1RWNLVVNv?=
 =?utf-8?B?UjBtKzVVc1k4ZEU2eGFLVVFQVFZwajNQUWJ5YUtiVytpSS9MbUJLWEhrOTRM?=
 =?utf-8?B?cGFQQzhZekRIV01hVUlyRHZTbGk4RnJxOGhFSFBlRXBpTmJBdWFvV2Q3eFQy?=
 =?utf-8?B?ODJmR0lCaDN6Qm9Ld0EyS1VmSi81Wm02aTM5US8xZGw3bWhYdHdZKzZNSXRD?=
 =?utf-8?B?eS96TEJISHhWZWJROHorV1o2bDZKdWNwZ01iTU1JZ0xZMHhsWlQwSjFVbk5t?=
 =?utf-8?B?VGZ6a1F6QmZCOFdQOVZCUlZHYUZpcWQ3NC9iNWRwMzh6NFMwNFNBSURNMnp0?=
 =?utf-8?B?RWlrV1BYVnB3RTlqK2lDYU1mWVFqK1N1SmlqaHJRRE13bGNlZnhnU3g3V0Qw?=
 =?utf-8?B?c3dEVzhIWU1DbHRFbDhoeXJERDRXT0FFRzVTL0pKUEZITHpMZWU3QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffdbf63-a56a-4517-cf62-08df02b6b2ea
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:39:41.9918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xstmexDXuIO5ABosEE1xC/tFgYzL5cuYqcpbTdUqCDNrPv5jFU2b2DSqMnk6sNkEA5aZ0IKVpVUz1l8HjdQ5fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8781

On Tue Aug 25, 2026 at 3:26 PM BST, Alexandre Courbot wrote:
> On Tue Aug 25, 2026 at 9:01 PM JST, Gary Guo wrote:
>> On Tue Aug 25, 2026 at 9:25 AM BST, Miguel Ojeda wrote:
>>> What I wouldn't want is a raw `as`, because the point of the saga we
>>> started a long time ago is to introduce better tools that allow us to
>>> get rid of the almighty `as` into weaker (i.e. safer) options, even if
>>> some uses of `as` may be "obviously right".
>>
>> I think that is rather a linting issue, not something that warrants extr=
a code
>> in kernel. We have been requesting some extra clippy features and I thin=
k that
>> is the correct way to go, not add a ton of methods and macros. Yes, it w=
asn't
>> moving on clippy end, but I could add a feature to klint instead?
>>
>> Do you think we still need all these extra function and macros if we
>> can get clippy (or klint) to enforce CAST comments?
>>
>> I can imagine the following rules that would practically solve all the f=
ootgun
>> of `as` numerical casts without having to use awkward syntax:
>>
>> * widening casts are allowed
>> * narrowing casts is disallowed unless CAST comment exists, except where=
 its
>>   value is constant and truncation does not happen.
>
> These rules classify casts by width, but the footguns really are about
> which values are actually being converted.
>
> In particular for value narrowing we still end up with CAST comments,
> whose existence a lint can check, but not their correctness (for
> instance, a bindgen-provided constant that changes in a breaking way).
> `const_as!` lets us drop them altogether.

The rule says "except where its value is constant and truncation does not
happen".

So I'd imagine just writing

    bindings::FOO as u32

and *NOT* have CAST comment, and a warning being generated if truncation
happens.

Best,
Gary

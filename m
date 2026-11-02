Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625450;
	b=USMgDZMtU06O6h/g0qSeQjVnCH/dU1tM0+z1I4dxzXNa4W+J9kzZvM8fDi1M8NFH5BNm
	 TpeUJEeOX6pmTMsNvqwViwPGCGYd08uiaZ0htTF9zwG3MUH5TcaKUWaZ8h1LjynXHCl1y
	 LfCeNiodqLSsloCqEQ/6Gg/U+fiJWI7kc79oSamWswTCicpNI5nb+fJzFWG7hYpg03rnN
	 e7q5GjlejuzgugigmriQtqB6bFLPpTeM+7lW5LIvgFAf9gVTwena2jh0HG8VgYbDa6SN6
	 0eJDSC12rh8ESq0pvR8PqMRLOWmCzoJsrQrOqtSJMzfXOQRZzzst9L0GJMMECM+pRfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625450;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8tyvXnRfKmy7PgQWjjN9T88QXTUR9gNw/pPVsPHCM3I=;
	b=ZpEmAyjHm2g5TPYjKqq8mXdXTV3IoDoI1wtGgqeHHtC3m0R9cNKsf+jeHfE9dvWZ0NPL
	 SP2j3EOWTlJiUThXAyKUEE1JIb22bdkGc9MljkVCTGuyfl48vECZS6WDHVJhg3R/kPYXn
	 qxSwe7At+hds8VC7KfMBp/iXUOgQK5JZHC4yGt4FMZik/TyQjP1/8ux+apdRYnQzxbprF
	 gS+THbI8qGux0f4qy7+EP7wwrRmXfvJiIYa2nnO12h6+svKS0UGyCsZ4FeoME5ZuIRAHY
	 i7xVRKYc3I+CEuj9rMJkv5VwmXMB/WI4iFg3xoh9gFESQJwYuT8kbu/9jmy+28yU/vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nYu0og4l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.66
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9966A606A327
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 13:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9966A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nYu0og4l
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzqAWwksQL07xwSBiPImC0u7ncJJWsw6Fjb4X1kOYJ9iMXoZHmxRBE0EQJglnpFBKLGr+dxs2zMbBDiLtDH9RkMkr2Stc8ch1xdpB8V4uFUNCndXWtkD/HEDboIQyWUdzTsSPglAHl+PS8+Nt6+xX17EZhd1SCUa3+wDJ9QMAqYQkBGGE8erg4OkEF1UmnQDMzoR+jtyaR9bVp5E3LfW22Xol0U5B6JYiwwBDX6BRekFmmN1XUnNPi8agHxFkDxozk2yf5dzq4unekqqr8xxK7MGrLpvMrr95cZMkoO0SnVFqiG9UbvBRO+IjVUtzlmIeon3kOFWiVktWQVkxqvXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tyvXnRfKmy7PgQWjjN9T88QXTUR9gNw/pPVsPHCM3I=;
 b=n/o8irv10NOYrRFFCJ4s0z3hdu2igGpIDq+uGcW2SKX6LM+GuIUK6CdKqgKMW2zFdmpLrqc3ldqSZiLmbAeiQk88I10bv44UGAiWcd8kKUsp398GLNqkAgUcNdWgy13fEoARqFqxCLhXAEB+BQcImdJEbKz8m4Y+TBZErO09IAGQptFjEjRsZWmmWbzuFCcNFzL2gV9qno+IyZ2KiWkWvPQni5neJTTLqG2EZGbI4qETH64ALIywGTml69rya7fUk6Qa8gG7fBvWtZK+dhltH6ZjPaw/FcA7nzUh9FSsArKlJKuT1Ndmxy6ACQN0Kv4ZzgcGtxVPcBUfQwTlUpP/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tyvXnRfKmy7PgQWjjN9T88QXTUR9gNw/pPVsPHCM3I=;
 b=nYu0og4lkNoY771qn83z8yRCwLhpw2OYiT73X5Vy6wjzwyvhYNlRRH8LvMTxf+nXPEuQwVQVbPD3OmonDVaZpUSXV5fQZNDDRNQByNU46Thsfdxxo1NtmEpXN6tvglYcbAi2nNmeduyvyYLIImcXsmvIfDsP2aeCqx/BPta0GIEXZsqDP83YBnMaiyIjg9/xXo2I2n2ZiahOXOqsez4V7/zSgWYaMFMYZVSTi7K3zlrDbt8R1cH7WtGtwVd+XJYIm2w2ruHpg5BXmTK00Y0pcf1bXqMj6Ur5XI7qJe5DtbS/0ZXzfXWcIMGw/SIufPpd0SsQtsZWHFKNbl0VWWj3nQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SN7PR12MB6816.namprd12.prod.outlook.com (2603:10b6:806:264::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:17:24 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 13:17:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:17:20 +0900
Message-Id: <DMKR5KCGPKX8.ZGFRFIM212L7@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] gpu: nova-core: gsp: cmdq: expose the sequence
 number of sent commands
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
 <20261102-r000-cmdq-prep-v2-5-c2c2b69bdec0@nvidia.com>
In-Reply-To: <20261102-r000-cmdq-prep-v2-5-c2c2b69bdec0@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::11) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SN7PR12MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3a565b-69f2-48de-cc18-08df38e3a259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|3023799007|261021121427099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	HqRRNCDQoe/XoX6M0e7zYAxnYo5d5PN8bgpuIeIPZGBOYgM8HBkpsxiFvjNrkgYWF3YLypZBamCnOlmloNe4dt+OpDMw6x3P9XPU8JK6lflQiyd/fi0v9AUxVyrl0xQ+PnSOWrYjADOG+c1TOQq20ft3B8KgUyM5T6DP6Urs14K9TMUyT4AzGSJBq4IrI3J0hdnshLi4Z4Ku/CPo6mgV5PwvA+KBewzuNzFez7RjoU1M50/QW17KXr6jI3Q8uVTL4Z0bpcyyTPnwoJbDevhETz2QR5TahVmHC4wB5Zb4Fd+iixeuToBEP+0Ob1cwJgTUIgV0SGbpd964ImcROYDu6fRj7RWCajaJwmFR0y22T0L5z6NGAwzClxFEI6t2uVClnlyvBgPTO12oHsW/Z+CLjKY3OhVd7A8ufIlt/aWvdXVmzkvbKrznC4bCxYZFi/vjBIHXXWrjnafSNFRt9hDdnSpYZJZ6/NaKB+mJVMhBpS4K0sMkU12cJDSvJGijmnNX8NQz3+6Dpu4GAxR11PjPzDdf5Jr2OvAvfV0Qf/3AQcoROSQvPvHhWVulFtI632znNEA5w+o1tui6V1cU1AdQi5lUiCFsminFTrhHdPEXOkfj9cvzQt3dB6xuABU2EF2vCT0rvylmO0t3WYECjZMq8mJ3zllK0MBDsjrtk7EeSQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(3023799007)(261021121427099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDA1RTJQeEZrbGZScUZkM2Q0cEt4aGNjL2t5cjZaRXlWR2ZkMTBsQ2wyWDEy?=
 =?utf-8?B?bUJuZlo0OHp2NkFTODNoRWx4SmQzUDJKWWV1eDdyQzdFN2twU0dqdFN4OXc4?=
 =?utf-8?B?WUpvSDNzK3JSMS9NRC9uSGFuS1pmZm5QNk5UL1VxbWswZmVubTV2NEI0bDgr?=
 =?utf-8?B?VkZCQkI0aXJxTE4xMUNPS2d4U2RxUFlHaVFKQVUyQWczc2tKZ0JrN1JtWUFQ?=
 =?utf-8?B?NGdjZUUwbUYxTHNqaUZwaTlmekZJUlRDbUxkTkxvWnN6VFBpUkdEVlJPR2Fy?=
 =?utf-8?B?RmxsRnpqOEdETzBxQjBHdCswS3RYYVArWlBKRFJGRXREMHBZbGNNZkhhbFpN?=
 =?utf-8?B?Y3JRN3BVYmo0T041N0ZWbWttOXVXcENFZjd2TWlkTFM1NWF6MXM4VU9SYllO?=
 =?utf-8?B?U1crQ1Y2VXRpZWJKWHhJaXhnUjBpUnBaSjZaMDhuODRmZVVVOEhVbWxJVkZC?=
 =?utf-8?B?MlZWSS9uSWlpMnlRbWNiUlJRZ01NS0FtNU9hV2tiNjhTQzJQNDkyVjl3eDZh?=
 =?utf-8?B?MkVaNVJvWDB0YWt1dXZPWElxSXo5Y1VncHpsVk93TjdpQXUxOS9iSVRKdEoz?=
 =?utf-8?B?NDBzNVFKVU1KWWg1bmxhUEI0Ry9kN2RZMForOHN3UCtDMFR5YkJKRml6YXlP?=
 =?utf-8?B?OFBpUUVreHFxSlB1dVBwRFZia1hUNGhDZEhaSERST294cFE3U2c1Q1BLZEJw?=
 =?utf-8?B?L0RCaDM5YlBvOFpibE1rV2RlK01wcFhKQjY3U0l3MEJYR3lYaTMyL25lY25y?=
 =?utf-8?B?TDJPTU5WcHY5S1BDWVJURGN4Z1hJSjBzYXkybzdVYmN3ZkxZNVJhNFNvMEx1?=
 =?utf-8?B?MUZjVThTOVFlYnlDZ2R1elhZQTR2Nytxa0U0RFlzUm15NmRjeEZBSEFPQnFT?=
 =?utf-8?B?dnA3bkRTRFpvNnQ5YS9DSndmMTNlTEVsa2JpbEJqUUY3cGFYVFhHSFZlRHds?=
 =?utf-8?B?YS9pZzRQdTZWWndMbFY3c2NHeGNFSTVtMVlQcFRXNDVncFRWdHpEMjVUTmk4?=
 =?utf-8?B?OXNFei8zdlFxZnEwYUl5N1BRa1paNk1qaHdKQkwzNVdWMGdBdmZlQmcyM0tM?=
 =?utf-8?B?c3VDY29ZZDZsMWt6RTNvcDJPUlg0UHRaZXE3eVpZMnBkaTNlK3kxMElwTEpz?=
 =?utf-8?B?QlJQNVc2a1BPaTk0aW5NT1MrYWY4Nk96MVBJaTNoYmJ3bWdyME1qc0JHTWNF?=
 =?utf-8?B?dnRDcklTN09DV281dmJpK2FCcWpMQ2huS3plQU9WUEgxQzdIMytvdUtpeis0?=
 =?utf-8?B?ZmMyMlpMRXhZZFhJK0lBdG1XVmFoTnd5SlZBNEF2c3pvNUlYaGJvaU02a3ly?=
 =?utf-8?B?TlJ5dWlsQmxwQVk3VTFucW1xeC9vVS9nUUlKSmxZaVB4L2prSnMvWnVBbG5G?=
 =?utf-8?B?eTlCL0dCSmg2dmhta095VGxWaC9RYWRlRmwzcDZPcG0yb1ZCcEZDOEhFZVds?=
 =?utf-8?B?dmZNWTJNT3BpZ3R0QjAyWWRtQnpYWHh3TDlML24rZW5WYnRWRzZZUVFMZm9v?=
 =?utf-8?B?eWpORHRIbDgxZkFqT2lmOEJKQVVPb1Jtb1RYa3hTenRkTzVmcThwNzRxb1pZ?=
 =?utf-8?B?dlBiR3Buc1diTTY0ZTBYQ1UyYjA0QUZ2aXJwaGJrK3RKU1VQK2VDMXNZVGwr?=
 =?utf-8?B?QnJvMmc2elVhMzlpR0VTWUlDYWdKcThJUC9iZzZlZjU4K3EvSXJBRi9lOUo4?=
 =?utf-8?B?UXJFTlFDNEQ4YXdRekI0WWZEQVMrVUJKTHQ2Zk5LZmNiS3lPUHlLSGhUbzVW?=
 =?utf-8?B?U2JySFh2SG9JV0lmWXNUdFlLeEdvV0lWLzVmclNSc1lTd2w2M2E2NVhHZ3dE?=
 =?utf-8?B?Y1ZXMVpoNVEvbkN4VjBhTHV1TEg3K0h5LzUzT1hPYkhyaGx6Q2ZtMForV2o5?=
 =?utf-8?B?ZjJoZzEzMjQvM0grUUVPVTdCUitUZXhxYWVJTXowbUpXQnpLSXd0VFI3ZWs0?=
 =?utf-8?B?MXJvcU1PbVJITWxCeUlhUDBjZHBjMzJjYjRMUEJ0ZHdWbDJCNGw1dGpqVE5E?=
 =?utf-8?B?ZEJhSEpPVCtCVSs3NFdpZXJQa2I5Ly9XazYvSmk1Z1dvZG4wQ2o0VVYwV0hx?=
 =?utf-8?B?UllxYzVDQ0krYlhPK0kxSS9OaWY5UjZXUVRDMk1kdmlXZHVJVjRSdzduazU0?=
 =?utf-8?B?UFp1RnBWdkQ5ekpqNUdmUUNvSkhCODkzNCtzK2tTQ09KTUt5SHJUK0JuSURU?=
 =?utf-8?B?a2ttMzFRZjlEODNNVmp0dlQ5QzlnYXkyRGZFdzduRWd4QXRnd05iTFpVbGo1?=
 =?utf-8?B?WWlxWFRGWjlaZ3RObjh1elJNOGZzeHFSeWlvNVBSSkpTZW9ZZ0dyQXBuQUd2?=
 =?utf-8?B?WXgrR0lQQTJVQ0QzNC9jbC9HT0tYc1F5V3MzQjE2L3U0V0pLR1lKRmxuSUtt?=
 =?utf-8?Q?cFZrqZw+F4F9HGv8aeW6HUg+49x/3Y67hOoEEJ4uYcRKh?=
X-MS-Exchange-AntiSpam-MessageData-1: nS2Dwx+aggWR2w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3a565b-69f2-48de-cc18-08df38e3a259
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 13:17:24.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3MnL3RA0mMxvpo9IG2G20b2Azex2T9oLJW4Ccn2p7vLlHNv4chcxEo1Dg/c9ubPyU6JKXwFrqg/v1skZI+qVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6816

On Mon Nov 2, 2026 at 9:09 PM JST, Alexandre Courbot wrote:
> The r000 firmware requires matching the sequence number of sent commands
> with the responses received from the GSP. Make `send_command_element`
> return the sequence number to that end, and ignore it for now.
>
> No functional change intended.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>


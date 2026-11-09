Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794209103;
	b=z6Wba6P2t2fEjsZaq/baMUxg6RiaBp9RUgzZs4+YExNV2e1Sz44Ph5bXqv4gGH5qnsaY
	 XSZR3pUBufH48nF4iNyOxYI0cd3gIA94G3RZTcTskJB/b5dj13+hdzlu0yR4h++ZXjYfv
	 7Q/aTUEFboxZwuM2pYHKoNf+DrHSSWm7JMKQmJ47O/kspwMzSHr3Y2wAs0hFdF0oyQcRx
	 c34uQjqnJb3XSUvZn0I/DemahXPNRfGABr/yxAS/fx+xetKlrSO0IufZbqiIElMonEKRg
	 36trVZSJp/lqTbGkPVUotqn5Gs368yfvwUnRe9VgqUOczdgcRnMAt5YYX2rLbqy1djw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209103;
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
	bh=OniamSoiC4pNmvoO0MMzOGCB71d5ogmVrG9Zu8VEEX0=;
	b=WHPtwyOalyEkMXzXj32Y3yMuHXxdWeWvA9Jn/7TSl4GzvfsAUstIz7jatMptnEVYEd1H
	 +HJvgQipC71jw4nuIhHVaD1JTWKwZqYCC5n7CEmrgddiu22c4QkHMCYV7JkUmW9YSn1tO
	 1unPGa5oxYcRFUNElg5nUQslstWoEWaFqBbhcq7gXQkOCPAlm2Z17sb4u+/O/s/w9EG7O
	 pSWVRaK5dvLBZBPIDZsO6Ok3PGeEHJjQK5F18vldK7Ho+ccUtI44iL2V8B0R2CH/VHFfB
	 TDMJhfIgHiIaXH1ZEIaY2nkZUeJFbgDsuSiajPy8Q+/0ORs8Oo5SJIREnXaV7KTblQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dLqzRDlU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.19
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011019.outbound.protection.outlook.com [40.93.194.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE58606A32A
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 07:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE58606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dLqzRDlU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8LOMOLDhSMt2nmnpg9oXFpAIhCVOyOfXXeDzu0wjcq21C9X3vx1bqE+K3mCzjs7sqOWA+vMi2iuh5s3S7GPTRj9lDj/HLIJ1rd/nbw5WdpIYX60e+jQD5s8CJr3nJRnERRsGPxDP1M2OOB+FyiAnnoAIV2mkFlpOWjoxynyeDPZmz5Qg+/JbL2AL+QAysGAt7qHKfAesqRrYtwzuVWTDrykcFOO0CACl96LlaZ+gBP+JXQP8XeeUz65qdFIsxgqiPOX3EMfOccu7tpYmtg1qMY5FknxecWRYBUr9taBr7kFNp3RJGwijPRdszwCPDvsUCDAublD4REfF1/FRa350g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OniamSoiC4pNmvoO0MMzOGCB71d5ogmVrG9Zu8VEEX0=;
 b=jU0KU/jubQj0CurOLVztfnUKAb6yJim3EfwRagr8T6eCcjzYDDVPMw+P8uuYTQ9JOSWYZdvvxJWJUL48oLNt4yw6CVA+14XrA5Id74PxAKxh8a7WJB7lbCr2VDFYOcuxkxG4IK08WlGJeFB0KQlnBL6MB8L4nNw+Pogs0sYj7B6Wuv+z5sCCyWaMcNwuEQ8bJjjh81b+kxk01gnuUUEWqKnJ4tYUJQd9kAgJsKzJFVtEsOD6EhNB1C9w+WCfPVg5seJkK6bYkYkmH2qWASt/r3S/1EDa4nHay6Z0j2M69eVuj3Pf/OpC5jAtux+ct6tRIC10YDLb9noJImWzyhPX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OniamSoiC4pNmvoO0MMzOGCB71d5ogmVrG9Zu8VEEX0=;
 b=dLqzRDlU+gMBpcqlMahucMlVMoINzzAc9Gq/0fg2442pHiRIFuR5Gd2WkMWtfiOizcbDzVYocUjiEU48txmbv3Xl0p0L+ioJyTyBsga+MuGYd8lWf5TI368JXhR5BV0/OXru2kmlarkr9KDv7sQ7MaEI6ZYP28CCzQtNv1Yd8radVyWsOp00Dfx7Rw4cpjDpQzF7LxL6Yr9K+UrU2xqix6cv840cez6v+dLc7Mz+Rzoyr9qqqJCzm2Mqbxd1ZCEDyMeLARDY4jODcxBPXM2t1xWuvmKOfqrGJwbkcM0o/j7/qr+RBivQQF2er34YCaLxHw5NNyJkHrA9yQoTFxnk7g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 BN7PPF34483F4BA.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6cb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 07:24:59 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 07:24:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 16:24:55 +0900
Message-Id: <DMQI1JOOBX33.1L8BGHI7ZVR1I@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 12/12] gpu: nova-core: falcon: program the
 FBIF_TRANSCFG register in dma_wr
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-12-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-12-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: TY4P301CA0125.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::18) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|BN7PPF34483F4BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 0685f1b9-675e-4a5d-988a-08df3e328faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|11063799006|4143699003|56012099006|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	52mTCI//o4oPqOUc07RGYIuK16EAbxem+EoVf8H1YGEcWorit2N28Oo2SVnDfUt1ViUEIPdWtej4+oapNCP3SclrcINseEh4zrScx8VvdaGJz60gFL/wrsKRyM+CiWbgWh3lPlMvP/5d6WrPKRbrXk/Ef4H3286UmiZiFx+waiyDHOVcUtIf1B+xhbrDUtH68CDHXuD7E/fY2EnJVPttfmWFTIiSUFwp1d+XJcL7SDbfOaRIW06F8UctGw0/ZpYDiqfsg15RoFOhqW53fX+rBEg+Jr6JA4MSIr7ZYvfcQEp9M5yQJi/Ipz1pmTuiPLVFdJlqjRtKvqrwUBB/e38RLWpq/qUdDGM9Ta4ECk1LtxFdJcqwmyvXNIOFW9Hzcvl80TM+bdWK8dtgnoWsPEb8X8vZJAvvE/CMmw990FNuKwmKMmXrprdpvpcTHKFJvCFhErdnuNN/eUecorbHPRSgMHKtkz/uyzwSWRgDJJfmHJe1MTEcvOoeuMxcw2H+c/xEkS51rj/6cIS3TzEK0OZOqtSP73ordF1u/lXIbrClHF5z5q+Gs//ZaHSkfBpDajxhIWiAvc8ol+KgZBiswL22RjapW37zqV84+EIamk9F7xbu+92oSBIBIrriX0WT/tVi45lTc8Pj8qD1Jo1uul8GPZD1Efh/iwn6cfmpoh8l/ak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(11063799006)(4143699003)(56012099006)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFVPWEVjTm81akU0elYySEUvOTVGcWE0N2VMVXNxd2hyeEVPS3hTVmgyQytn?=
 =?utf-8?B?QWsvaElqLzRZU2hKYlZsRkdodjlIbnNZdVZ4MUdQeEFJdE1wUmV6SlNxL3Vh?=
 =?utf-8?B?SGRuYkFNWHVOSjcvcTdnK3ZkQXplVWt0MEZvb3RSM3E5NnBjckJBZ3h0bXlv?=
 =?utf-8?B?UTlqMG5pckJNajZ4bVJoamtmV3ZjSWRhblJBTzBqczQ2YjVsdDJpR0p3Y0dr?=
 =?utf-8?B?Y01aUk9HbDdxZStOTklZQXJndVd0MTZnbktyWk5HdFlCZ2FRdThiRjVab3lv?=
 =?utf-8?B?c2tyVzlpYXdLbC9PZUVHYTB2cG5hVnBSbTRwbHZVVWYwRmhtYTUrbnhyalM1?=
 =?utf-8?B?U0pWSUoxN3pKeHV1VFdSeWZSR1h4NEJGUkl5UllYTmJrNm9XZ2ZSNktpR2RT?=
 =?utf-8?B?YVU5WkFzZ2JCZUgzdFNSTW5ZaHV0NWNoNXBBSXZNTk9Jb2dVaHhIMEllVTdH?=
 =?utf-8?B?Y0JneGxaR1B6SGpibTdoTVhRK1JRUVpNeURRWWh6YlBTUldmTFlXY0RTVVp0?=
 =?utf-8?B?N0oxMEJ2WFFZYkRuM3E4QjRCZWdlTFdocmZ4NjViNW9SYWhDdEhxRFdzbUxD?=
 =?utf-8?B?NTdNYWFyZEZrMWdNaUliTzhBWWM3VVNlRys4dmVOUXoxU1RuS0dOK1YrYkhN?=
 =?utf-8?B?cTIvYXFNWnF4K21JVjJQb0hDVnNjc1dDMHRhSkRWOEhneVpIbStUMUd5c2Fi?=
 =?utf-8?B?cEVaWVpjYXBHTWs2RWRxKzJtQ2hia0Mya05BWExacE1zVVBUaGRkSGZYT3NC?=
 =?utf-8?B?QU5TSHlsWjlPN1VDTWhDUWRvd0h1V2t6T3U2RTZzWEpXQmwyOERmTzA5RE1n?=
 =?utf-8?B?MlBaaGlPTktPdEtLMW1rVXRLZEZDT3ZldU1IbUgzSnJIUm9GTUxoZXhaVmUz?=
 =?utf-8?B?M2Z1UUZmbWlieVFKaEZRV0lWbis2L3dSaWg3Ti9hVDlpcmoreXpETWVyZ2ZH?=
 =?utf-8?B?M2dRUG5DMFJTZit1R2R3bTI2WVhCVmdLMVpPR3pMbUVFeVJxbTJGTzNzTGJQ?=
 =?utf-8?B?QkkwTFoxb3pSSW9jVWxBcUVWdGVOZlI0Ym5sOGJUcVNXQ1NBc2RXQVFNeWNY?=
 =?utf-8?B?TEdUM2w4OHF0dG5pbERFV2VyRjBsU25NaVkveVhNdTlxSnpISS91KzNmQ2dN?=
 =?utf-8?B?Q1hnWC9SandqNDFaT3VWNTg4RnkvTEZKb2wyMjNrc0R6TGxwVDllOVp0Z1R4?=
 =?utf-8?B?NmhYQ0FZZTVoYWpwOEY5VVpSRHRzNkFBNGJONmMyWUVNVi9zUTMwWEwyelFG?=
 =?utf-8?B?bDV4bTk2dzR6QVRDK1YzQ3Z0VkYrcVBycGZ3cHVsbWxDMVBmOTU1cXpIR0dF?=
 =?utf-8?B?NDFONlVKQndyTFdubXcvejZtVTBUSncreXVwYlFoK1VpblcycFhSU3lBOU1W?=
 =?utf-8?B?QlV6ck00SDBQSnYxZXJKYzVIK3FFWDdUa3dESW80SnFUWXdBRkprZkdiMUxm?=
 =?utf-8?B?MnY4KzV5QXlQb3NFQWFaQVdZcjNkWjRlSm5LK01MUldlSFhraE5mRWM1VUxY?=
 =?utf-8?B?M0FhZng1SnZQMHVxVHJNNUtJNUdhS01lcEd6aTRIL0xyeDRUVWN5Z256M2J4?=
 =?utf-8?B?a1M0b0w4ZzRwWDNpRjNtR1MwTlRFNTByYkpsWHRzRGozWksrYWlqcndvMkg4?=
 =?utf-8?B?UnM5VWxMMjBCT0JwQ3V3QjhFcDVtWG5leVkzOXp4aEZUYVIrOFprRlNlN05t?=
 =?utf-8?B?MnJIS1ByTTRnVFViUXZqV3U3NjMwWnFmcmsxeHlUdEcxN2pRUjF2OUZPNnlK?=
 =?utf-8?B?VU1xZU1BRHAwRGFYeFhxN0hiTTcveURBUFBza1NzUThmTmZZUy8reUZURVNV?=
 =?utf-8?B?YWlEYTVnSDd1WjVQYmlvRDZYcUJDV1BUbHJWTlVuVzlLNVFORHdKR3NidThi?=
 =?utf-8?B?Nk9JcDNOeHJSQzlDNGZQWXoyTjJJNzhQMVpsTDN0RzRhUnBRcXYwNnZGN0Z4?=
 =?utf-8?B?THhUV0lHUzFRcy93TFdiT1VhdWpNNjlaMTdiMlBkZGE0Z2cxRDd4aWJLUCtk?=
 =?utf-8?B?blVCZk5PNWpXRXpFektPVFdzS053OVM2RExHUkU1UEM2RTdmQjU1LzVic0Np?=
 =?utf-8?B?aUpsb0xuSE5GNGR3alAxcXNYMUJzTG9HSElxOFhWSkJ0dU80OHE3aU9lSUdF?=
 =?utf-8?B?YncrZS83OUVMbDRPT2VwVGloT2dESVFFRnBlbXhZYjVIQTZYUmIzd1hjY05j?=
 =?utf-8?B?dTBXVXJjZ0VxK09BREFVbHdZaDFUUk1QcU9yRXo4WFdzaDZqbHZwMGNpcFZy?=
 =?utf-8?B?SFk4QllVN09aMDZlZHFXZDgzbkpxVUNoeFRJSG45QUdSbmlSMVNSd1dxUXZ3?=
 =?utf-8?B?OS9xdEp1blltN1RIcnhvbC9sU3hkaHFsMXdTOUI2NENQYXhtcEJFQnZiLzFo?=
 =?utf-8?Q?/JRAjo1M/PplXvSivEXmSlqiWR3PO8yM0KEkU8yFInUEe?=
X-MS-Exchange-AntiSpam-MessageData-1: Kg+KOP1i3+JRcA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0685f1b9-675e-4a5d-988a-08df3e328faa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 07:24:59.0927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duRHomkxyeLUYekNlGea6RYCHG5iEPWdOSPcCUcfQM8YMDDNgbFAnmmzIuiFiKhLD4IKfp7iDcDpGJmkoYSDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF34483F4BA

On Sat Nov 7, 2026 at 6:48 PM JST, Alexandre Courbot wrote:
> `dma_wr` takes the source of the transfer as a parameter and can derive
> the value of the `FBIF_TRANSCFG` register from it. Do it so the caller
> does not need to program this register beforehand, which could leave the
> door open to bogus setups.
>
> Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
> Link: https://lore.kernel.org/all/DMNWO08EFJD8.D2G9X082FUKN@nvidia.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>


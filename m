Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792686809;
	b=dyE3jD7jmSl8RO44jD9DqGUJ9l/Vs5U1EdV0pjC0Rocj8ja9YUUXcGCzw98SV6MY/GKM
	 t6pKJuY2iGwJz2DkzSf5jdGvKQXmAM2J461RKQsHX9Sr51wBaTJc6Y5ngJW/99bpJXllv
	 WMFnXvaBe/6CaFMamzd5N6+JZVi/Ylx2H2jWkz1hpBsVse1TcAVj1Wx3sMF8Vj8tzi1Ar
	 mZ4msiGpyjtfB/mz2/MCwu/jGmb+/0IrqvkB+F6f8yhIPSFzH+6Un7YaHcyjKcrPlgfVx
	 j/QB9WFYM+QMHD+hUTLRy0XfQAWvWrLj6kG3LakhTQCnUNjSMtPfYuPTwmBREX5l1vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686809;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OO2YWMtuS4wnOtWDIHs4tEdrqDt0Joh3sWu1NeTUphQ=;
	b=ACZRf/4V/PBLNbs6SgphWU93rPMwSn3QT5Msd9GAJKZjO0dGkITZdQyCxihM7ZmBKgLs
	 7OvF4wXs6cYwihLnm8uWEzJOkhPivPA+wufyhc+nlcWfjgk+XqxQxyY0KwQcPtT4qYZ+C
	 M+TsXYzHJ1Ks7ZHP28zZJuBka284en/JxWeuwzFNmWpYomb4Q/44IttdWLVqVaPkoVX4o
	 t8jB2J21wb7mzzQUNEulCuO/um0bGoUcQXyT1l+Po6I5W7B4wRZBKuiFx/iU5KaPFVSAg
	 l96UEzKwCYTADWK41tZx/TrqPl3etsYgwsWrfHbbSwDOh0Z3fiSEGbBjF7NrH7FZ64Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rSZD8kMt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.7
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013007.outbound.protection.outlook.com [40.107.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F97606A319
	for <nova-gpu@lists.linux.dev>; Thu, 22 Oct 2026 16:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F97606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rSZD8kMt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBfCVLrm65+wsYNq5QyJMdW+sbQb0ZvckXnvYBP1FvUAU5dAV1X2c/6ta1U9dqFOSjXpYzPgJ+1ahuvXyEfsXSsIo2vW/P5LwWVb2bRjKwVuur+lz3ir9VSmuubNzIZxliPuTuAEy+DeM5JiyZTbSoMrKWGhDYeNPBUrMMPzxpGqKB0yxbIhiJYB9jhGahD0UIftf9dqAsxTMHSifTpwkRlTOuxUhcMPBgq3GPJ5jvksn7rZFaiM2eC8GHmWrdBDcKgRuO46u3k0+1kse2SZsY9nA94mkCYRrcq+vnvw2g7xKcDt2xHnSkZK5oVumKEa9paUenZpyI9P+/3LgpabyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO2YWMtuS4wnOtWDIHs4tEdrqDt0Joh3sWu1NeTUphQ=;
 b=LujyhxWx6dE+P5oB7Q+GTIkCWzR1uj7OYY5xWJ4+QWT5B3han5gNsGrksNfzCQNYB1/sw+GlCMPRN36Yc9oBVBeIuZ814rH7i0GqMTYx8Oa2YynSIil0xNdZmfEr18xI34KI9EmDDuIDKUemyFgrtFX/enwpQ6SuyoTKhzNnQOYwqQALYe2d0y2TBI29pFpKWh3Fc+YEWeWiVYHWNpmWtVSxCUSX88V5VE2AkoXCLCND2IPb59c70VSUNfpdwpSmwxW0xplfn0kLtUAmTaeVFDBc5MrlpFy5vevoRNamQ7Wpnr3bBVD5LHc9Kcpq0OSLAtqQj0BbqVBmh/DQl7c31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO2YWMtuS4wnOtWDIHs4tEdrqDt0Joh3sWu1NeTUphQ=;
 b=rSZD8kMt5vcZaBv2uETvgZFKZK4siPjLuVyWW2NKiAf9zy0H/yONtW6BV+WFSPztZhUtu/Ae4OMn9zmtDtvPW1WRUzxtPDjLhUGHU4xALKdP5A/eg/ViCnFgrN7koLum559va6BAQdvAPn8utJkFXKeEe5nFSypcjJoUPr3dBLa2+qD8eSNattKNt2JzwEc/D/4N8mEE6aLo7QinapvESsOfqII0kLRSJ2cPqSdMv5hsgsO+zIcrCZtVgPLs5sgAAiEQCFmGWHRV6eB/1+KVjVAqqePdB1t+fATS94+XMUteMSGquKxyMAmaKlDuoIm8AzZPS7S/NgILYWmYMHK+ww==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by BN7PPFFF39339DD.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 16:33:25 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 16:33:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	"eddi.salazar.dev@gmail.com" <eddi.salazar.dev@gmail.com>
Subject: Re: GA106 booter error 0x15: root cause found from bare metal (no
 Linux)
Thread-Topic: GA106 booter error 0x15: root cause found from bare metal (no
 Linux)
Thread-Index: AQHdYi68/kGMjqjDUEm1pG54qLdfS7cJwb8A
Date: Thu, 22 Oct 2026 16:33:25 +0000
Message-ID: <b26b398a83786047537f46b728d012e4b042bd6f.camel@nvidia.com>
References:
 <CADGWsUZnFuoc2YZx87zoFpsvRHWA2sRuTUZPhdpwSJyT1WmOnQ@mail.gmail.com>
In-Reply-To:
 <CADGWsUZnFuoc2YZx87zoFpsvRHWA2sRuTUZPhdpwSJyT1WmOnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|BN7PPFFF39339DD:EE_
x-ms-office365-filtering-correlation-id: 2f0bc949-c03f-4eee-8059-08df305a3220
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|10070799003|366016|261021123027099003|38070700021|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 dUwQlzMBOk+snQ4hVotvAQPYpF0Bjb5F+8N+I8GGZSvCQVmOauFpcr9DKdFbAEXuhRXcW7UHDMDRel7/NIwNN0jd5KIiyVYgYC+s0FT+bc5RnZd/dEEJIXqSPh/iL44LX35Dh4Nix7k8YuLxrXwzpU8e+sBHNO+2hA5q0wbQ0BpvQ1c+u0AEvNgcFq9QSNjHz2WExyLfqbhBkhvmLWOSHy5DXcB2Tvo8Hh4oBzMfkcyVuxzFTIy5nsaH07AZ1e4iLFuSfkZy5rDkhCD5OkKnKnwHPVtpdkHq4OR58WCxWOd5l47JqIHzbafaH5itQtcYwegsOpoNuA8AahN4F18tx049i8a/i+ofdvtpYL0Dpd1fhk5j20PQIRclIol2JHuA/YNJWv9mTjnt1FY1AZqr3j5wR83kGVDCovA6J1p36Ec1b966OWMKWTvZY3jEUzofGFq0jKOn1BLNGR+JLTnaUxbAHVYP+Nn86YDxpsBBoQWGmNwRHUIKVLSCKGiQvOCmz2PEbDzuX7JG1HeA2mMbou8VaSxorTru8HiF7lI2D0hNonRfBppfZFo2H94AqNI+CrZzI/c7zf4phq7O+OnyYX2HUio4OJY4z+odEegSeh2WnaxAbQSzIio3PXQ5k3+UB1QYbjp4Bvrj/O3D2NBTEEy+nI9jBz/vdeooeTN+x5nmt7p7+wcAsX7h89dFTeLA0U5KvGG0tZfy7cheATWUtJt2GmwobIpV/+MCUqIvRHw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(261021123027099003)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVlmWkJ1MWlJUmVsNDd6LzBZTTNDaUM1Tnl1V0s3cHU2K2VsZ0d6bnppRTk1?=
 =?utf-8?B?N1hnQUM3TzhHWW4vN1V5dnFMc0dhWTFTTmhUd3NBd3I4WlIrejA2UVUvOXR1?=
 =?utf-8?B?Ym5CeVAwMGo0T2F4d2h6UU1Hc2ZtaWhweGZ3eHdMa1NnYjRmSGpETTNxY0lP?=
 =?utf-8?B?NWJJZnZoOVNUNk9PaHVtWFdQREcwZUs1eVcrRkFpWXhHTWpBSjhhbmdsemZh?=
 =?utf-8?B?Uy96elBYRmYrOGFIQXRvTG5JL01MYkwydnNxK2JNeFpUZEhqdnlJN3VIdXI3?=
 =?utf-8?B?Nm9wSDZPSXhyQU8wV1ZxWVY4cmw5MG9QTWRiVldlUDVCZ2FDUmhraVhXMUFj?=
 =?utf-8?B?M3hvblZvVkVmUTVITjgzYm1rbWoyVWNzTi9ZbkV6K2lGQVhyTTdCOEZSNXFZ?=
 =?utf-8?B?S1JudWs1bGhkY2RlejFKZ3Z2ODdkZ2sxSXhiTjRqWWZmcnRMU1NSU2xTdUZj?=
 =?utf-8?B?VFlLQzNnTmp0UHpacVFoUzhTYlhtaFVUeENqemtmVVRDRkFXem5rRk5MWlRZ?=
 =?utf-8?B?clNMbWVXYWNCa25BYjdLM2g1T0lrN2lZZkZ2eDFrZndKSUtMNXVlWEs1cWZR?=
 =?utf-8?B?MEF6dmpWa1lScUE3SUtyMkIyaDZHNjlJUk13ampld1hxQ3FtZkF2QWc4OEh0?=
 =?utf-8?B?UCs1bzloV05sSnlHUHBUSXpCSHgvR2lZR2JDdnR3TzY3aXh1bUtldit2ZGsw?=
 =?utf-8?B?OGpmSHgwcTRocUd2a1c1YnAzLzkwOTN0K2g2azcvTXJMbEVrOWpvNFpVZlJm?=
 =?utf-8?B?WFZPekFsd2xTQWNEbzQvdGpXTGtZUHB6a0hTekFybXZOM0lyRFE3V0pKeW0y?=
 =?utf-8?B?Nm5BUXFodTN6MkQxUEtqMjFtNnlXUWFIVlpucHIrYTFaUkZMMkNSVkZQWTJ4?=
 =?utf-8?B?WFY1enExbGw3ai9YT0d2c0kzbittOGc0WHFwdUtUcmVKckJOUnNuN1VxU2lt?=
 =?utf-8?B?YmQwOVpSdDJ2cnc2R3VHNWs5eWtLSWlkQmVxS1h3TW50REJQMjdWczJEOXZz?=
 =?utf-8?B?Y1lSeUxBbk8ydHJNZzl4cUpaSVFnRkdoakMyV0dmay9ZSzhQMzB5bzZtZzRp?=
 =?utf-8?B?cXFUVjBYcUQwTmhhMVYwdjFwVVVHUnJMSUZKNFFBd2FNanF2MmlldEVQbkVr?=
 =?utf-8?B?dUxkTHdFTk5WUjAvVm54N1JIbXA3eGIzZnhMcXhUd2xuVFQ1emIvMkhVN3lz?=
 =?utf-8?B?TkNGd2ZVREtNVXgrenpHb0MyRG83TE1TcW5lQjJhTVhWb3A0eUZ3a215QXdZ?=
 =?utf-8?B?MGwzYmZoUWZXajZOOXZZU2E5dER6aEM1YWZ6TVNRSHl1UHhMRGs3cVFZblJ4?=
 =?utf-8?B?ZXlxZUkydERLQ0RUZVQyWVFERWNBU1VOd0ZOQ0lJZ09xemU5dTNNWTJMZlo2?=
 =?utf-8?B?UFdTUUhqTSsrMGFQLzNZQ3dzanBTL2VOWUJrTVlFZ21yVnlrMUF4U0hkb1VG?=
 =?utf-8?B?dStBaEJKaW0wdmFWTmRlR2xWQTZZT01qei82ejlHUXFUNWZSdG1FOTFHa1lq?=
 =?utf-8?B?YXNSem02OENwNzNaU09kN3pXUUN2RGw2cVdBNHFSYjNhZ242d05yem54eHdy?=
 =?utf-8?B?dm5XY3l5RkE4NTU3MnlYY2ZzYkhoZGJja09nUGZEaTJVODIvVjBiSnFxbW5E?=
 =?utf-8?B?aG1QeDlkWjZNTXR5emtVelBzenRoRlJZNUU0cHNoYnlSanpoMkpaSkFjdlVM?=
 =?utf-8?B?eXpFYzJwSXB6OVZDNDdmU3hMeGdLMjRxMlByL1ZuTmNuakwzWHRLQWJkVUtt?=
 =?utf-8?B?K1dmUWZtUlNnMndpeTV0dkVXOW9SNzVwR0VrNWNIZXJNVUpSUngydDdhY09V?=
 =?utf-8?B?dC9rbHpmcFVpa2FQeHk2M0tNSWpab2xsNnB6YUU2ZVZrNEx2enh2T2sza1pj?=
 =?utf-8?B?S3FyclJwbzU4Q3FxNVpENjM5emFldUl1aG0yRDVYdUNZQURjVXQzbjA3YkI1?=
 =?utf-8?B?L3hsSWV5NnZjelVJa3lZTENCSU9BY0RKYzdHTnBUZC84amNCM3N5TjVwQ3Ar?=
 =?utf-8?B?eTdYQURPUCtyeXh1S2dWbkdKTjUwdkRRS1hpT1FUZHhya1paMXZkamRtaHhN?=
 =?utf-8?B?dERDR0NkbHhzTTBFZGtBb2NDK3VVZEEvRlhlOHNWSTlrVGg2cVpjS1lWY0tI?=
 =?utf-8?B?bmJYckhrOXczVzNWVXFnTmhteGhUamM2aEVVMDh2RHZMWGRTME96K29nc3dE?=
 =?utf-8?B?ejM4cS8yUkdCVEk4TE1ib0JqUUVueHBCR0lVVDk0L0JUcUo5QXNZSUxYaGNi?=
 =?utf-8?B?Rno2UWc3ZXJGQk54OW83UHJ2czc1U3NlUTZORDBSVUdlUTliNStNL2lEQzVZ?=
 =?utf-8?B?RytTL3ZkQ3kzVmliaGRlY0dGU0drMGNCbXZYQkU0R0hrVHJwNjNCdkZiVkRM?=
 =?utf-8?Q?iA47jpUazX04tXAApuYdC2cCT/dA0ZIqdDttYpnf/PqU1?=
x-ms-exchange-antispam-messagedata-1: qdngh75B1AcQRg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBA24777E8B43846953BD9D07A4B696C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0bc949-c03f-4eee-8059-08df305a3220
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 16:33:25.5819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jTN4gXfPo6Mq3NfLxxffVqCJTleXSNR4aevXcocsKCzKfar8dbzf1cN9R+HEsyY90otfkJfHqvWqHO0ygzxuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFFF39339DD

T24gVGh1LCAyMDI2LTEwLTIyIGF0IDA4OjQxIC0wNTAwLCBFZGRpIEFuZHJlw6kgU2FsYXphciBN
YXRvcyB3cm90ZToNCj4gSGksDQo+IEnigJltIGRldmVsb3BpbmcgYSBiYXJlLW1ldGFsIHg4Ni02
NCBPUyBpbiBSdXN0IChCTU8tWCkgdGhhdCBkcml2ZXMgYW4gUlRYIDMwNjAgKEdBMTA2KSBmcm9t
DQo+IHNjcmF0Y2g6IEdTUC1STSA1NzAuMTQ0LCB3aXRoIHRoZSBzYW1lIGZsb3cgYXMgbm92YS1j
b3JlL25vdXZlYXUuDQoNCkp1c3QgRllJLCB5b3UnZCBiZSBiZXR0ZXIgb2ZmIHN1cHBvcnRpbmcg
dGhlIG5ld2VyIHI2MTUtYmFzZWQgaW50ZXJmYWNlIHRoYXQgTm92YS1jb3JlIGlzDQppbXBsZW1l
bnRpbmcuICBBdCBsZWFzdCB0aGF0IGNvZGUgaXMgYWxyZWFkeSBpbiBSdXN0LiANCg0KPiBUaGUg
Ym9vdGVyIHJldHVybmVkIDB4MTUgb24gOSBib290cyAoNiBpbiBhIHJvdyBmcm9tIGNvbGQpLiBJ
IGluc3RydW1lbnRlZCBldmVyeSBib290LCBnb29kDQo+IGFuZCBiYWQsIGFuZCBpc29sYXRlZCB0
aGUgY2F1c2U6IG15IG93biBJT01NVSBzZWxmLXRlc3QgdXNlZCB0aGUgR1NQIGZhbGNvbuKAmXMg
RE1BIChvbmUNCj4gdHJhbnNmZXIgZGVsaWJlcmF0ZWx5IGFib3J0ZWQgYnkgdGhlIElPTU1VKSBy
aWdodCBiZWZvcmUgdGhlIGJvb3RlciB0b29rIG92ZXIgdGhhdCBmYWxjb24uDQoNClRoYXQgZG9l
cyBub3Qgc3VycHJpc2UgbWUuICBIYXZlIHlvdSB0cmllZCByZXNldHRpbmcgdGhlIERNQSBlbmdp
bmUgYWZ0ZXIgdGhlIHRlc3Q/ICBJIGRvbid0DQprbm93IG9mZi1oYW5kIGhvdyBkbyB0byB0aGF0
LCBidXQgaXQgbWlnaHQgYmUgZG9jdW1lbnRlZCBzb21ld2hlcmUuDQoNCkVycm9yIDB4MTUgaXMg
Qk9PVEVSX0VSUk9SX0ZMQ05fUkVHX0FDQ0VTUy4NCg0KPiBSZW1vdmluZyBpdCBtYWRlIGV2ZXJ5
IGNvbGQgYm9vdCBzdWNjZWVkLg0KPiBUaHJlZSBvYnNlcnZhdGlvbnMgSSBoYXZlbuKAmXQgc2Vl
biBkb2N1bWVudGVkOg0KPiDCoMKgwqAxLiAweDE1IGFycml2ZXMgd2l0aCBXUFIyIGFscmVhZHkg
ZXh0ZW5kZWQsIHNvIGl0IGlzIGEgbWlkLWJvb3RlciBmYWlsdXJlLCBub3QgYSBsb2FkDQo+IGZh
aWx1cmUuDQo+IMKgwqDCoDIuIFRoZSBHU1AgbWFpbGJveGVzIHJlYWQgMHhCQURGMTAwMiBhdCB0
aGUgc3RvcCBvbiBiYWQgYm9vdHMsIHZlcnN1cyAwIG9uIGdvb2Qgb25lcy4NCg0KU28gQkFERiBp
cyB3aGVuIHRoZSBkZXZpY2UgeW91J3JlIHRyeWluZyB0byBhY2Nlc3MgaGFzIGdvbmUgb2ZmbGlu
ZS4gIE15IGd1ZXNzIGlzIHRoYXQgdGhlIERNQQ0KZW5naW5lIGNvdWxkbid0IGhhbmRsZSB0aGUg
SU9NTVUgZmF1bHQuICBEb24ndCB0ZXN0IHRoZSBETUEgZW5naW5lIGxpa2UgdGhhdC4NCg0KQm9v
dGluZyBHU1AtUk0gaXMgYSBmcmFnaWxlIGRhbmNlIGFuZCB0aGUgZXhpc3RpbmcgcmVmZXJlbmNl
IHNvdXJjZSBjb2RlIGhpZGVzIGEgbG90IG9mIHRoZQ0KYmxvb2QsIHN3ZWF0LCBhbmQgdGVhcnMg
dGhhdCB3ZW50IGludG8gbWFraW5nIGl0IHdvcmsuICANCg0KQWxzbyBrZWVwIGluIG1pbmQgdGhh
dCBhbHRob3VnaCBHQTEwNiBpcyBvbmx5IDUgeWVhcnMgb2xkLCBhbnl0aGluZyB0aGF0IHVzZXMg
Qm9vdGVyIGlzDQpjb25zaWRlcmVkICJsZWdhY3kiIGFuZCB3b24ndCBzZWUgYSBsb3Qgb2YgY2hh
bmdlcyBhbnkgbW9yZS4gIEhvcHBlci9CbGFja3dlbGwgdXNlcyBGTUMgbm93IGFuZA0KdGhhdCdz
IHRoZSBmdXR1cmUuDQoNCj4gwqDCoMKgMy4gVGhlIEdzcEZ3V3ByTWV0YSBjb3B5IGluIHN5c21l
bSBpcyBub3QgbW9kaWZpZWQgYnkgdGhlIGJvb3RlciwgZXZlbiBvbiBzdWNjZXNzDQo+IMKgIEZ1
bGwgY2FzZSBmaWxlIGFuZCB0aGUgcGVyLWJvb3QgQ1NWOg0KPiANCj4gaHR0cHM6Ly9naXRodWIu
Y29tL0FuZHJlZVNhbGF6YXIvQk1PLVgteDg2LTY0DQo+IA0KPiBIb3BlIGl04oCZcyB1c2VmdWwu
DQo+IEVkZGkgU2FsYXphcsKgwqANCg==

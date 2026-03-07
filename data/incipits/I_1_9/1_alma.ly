\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    r8 a''16.\p e32 f8 e r h'16. d,32 e8 d
    c16 h a8 r4 r8 h h16(\trill a) h8
    r c c16(\trill h) c8 r f, f16(\trill e) f8
    e8.\trill fis32 gis a16 h c8 c16( h) d( c) e( d) f( e)
    gis,4 e'4. c8 a d~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    r8 a'16.\p c32 d8 c r d16. h32 c8 h
    c16 h a8 r4 r8 gis gis16(\trill fis?) \hA gis8
    r e e16(\trill d) e8 r d d16(\trill c) d8
    c h e a a16( gis) h( a) c( h) d( c)
    h4. gis8 e a4 f8
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    a'2^\solo gis
    a8 c16[ h] a[ g f e] d4 h'!
    c, a' h, gis'
    a8 e c a e' e r4
    r8 e gis h16 h c8 c, f d'
  }
}

BassoLyrics = \lyricmode {
  Al -- ma
  Re -- dem -- pto -- _ ris,
  Re -- dem -- pto -- ris,
  Re -- dem -- pto -- ris Ma -- ter,
  quae per -- vi -- a coe -- li por -- ta
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    a'4-\solo r gis r
    a f d8 r r4
    c8 r r4 h8 r r4
    a'8 e c a e'4 r
    e r a, d
  }
}

BassFigures = \figuremode {
  r1
  r
  <6>2 <6\\>
  r8 <_+>4. <_+>2
  q1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}

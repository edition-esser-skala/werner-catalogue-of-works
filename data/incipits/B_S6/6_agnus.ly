\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    R1*6
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    R1*6
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    R1*6
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    R1*6
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    R1*6
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    r2 r16. a''32 gis16. a32 e16. a32 c,16. e32
    a,4 r r16. d'32 cis16. d32 a16. d32 f,16. a32
    d,4 r r2
    r16. c'32 h16. c32 g16. c32 e,16. g32 e4 r
    r2 r16 h'\p h h r ais ais ais
    r16. h32\f ais16. h32 fis16. h32 d,16. fis32 h,4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    r2 r16. a''32 gis16. a32 e16. a32 c,16. e32
    a,4 r r16. d'32 cis16. d32 a16. d32 f,16. a32
    d,4 r r2
    r16. c'32 h16. c32 g16. c32 e,16. g32 cis,4 r
    r2 r16 d\p d d r cis cis cis
    r16. h'32\f ais16. h32 fis16. h32 d,16. fis32 h,4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1*6
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1*6
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1*6
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    a'4.^\solo e8 c'4 a
    r a d d,
    r d b' h8 h
    c4 c,8 g' g4 fis8[ e]
    d[ cis] h4 fis'2
    h,4 r h'4. h8
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i,
  qui tol -- lis,
  qui tol -- lis pec --
  ca -- ta, pec -- ca -- _
  _ ta mun --
  di: Mi -- "se -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    a1~-\solo
    a4 a' f2
    f2. f4
    e2 ais,
    h fis'
    h, gis'
  }
}

BassFigures = \figuremode {
  r1
  r2 <6>
  <\t> <6 4->4 <6 4! 2>
  <6>2 <7 _+>4 <6>8 <5>
  <5\+>2 <6 4>4 <5\+ _+>
  <5\+>2 <6 5>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "ob" "1, 2" }
        \partCombine #'(0 . 10) \OboeI \OboeII
      >>
    >>
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
      \Timpani
    }
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
